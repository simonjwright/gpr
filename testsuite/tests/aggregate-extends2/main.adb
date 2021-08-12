------------------------------------------------------------------------------
--                                                                          --
--                           GPR2 PROJECT MANAGER                           --
--                                                                          --
--                       Copyright (C) 2019, AdaCore                        --
--                                                                          --
-- This is  free  software;  you can redistribute it and/or modify it under --
-- terms of the  GNU  General Public License as published by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  This software is distributed in the hope  that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public --
-- License for more details.  You should have received  a copy of the  GNU  --
-- General Public License distributed with GNAT; see file  COPYING. If not, --
-- see <http://www.gnu.org/licenses/>.                                      --
--                                                                          --
------------------------------------------------------------------------------

with Ada.Text_IO;

with GPR2.Context;
with GPR2.Project.View;
with GPR2.Project.Tree;
with GPR2.Project.Attribute.Set;
with GPR2.Project.Variable.Set;

procedure Main is

   use Ada;
   use GPR2;
   use GPR2.Project;

   Indent : Natural := 0;

   procedure Put_Indent;

   procedure Display (Prj : Project.View.Object);

   procedure Display (Att : Project.Attribute.Object);

   procedure Display (Var : Project.Variable.Object);

   procedure Changed_Callback (Prj : Project.View.Object);

   ----------------
   -- Put_Indent --
   ----------------

   procedure Put_Indent is
      Space : constant String (1 .. Indent) := (others => ' ');
   begin
      Text_IO.Put (Space);
   end Put_Indent;

   ----------------------
   -- Changed_Callback --
   ----------------------

   procedure Changed_Callback (Prj : Project.View.Object) is
   begin
      Text_IO.Put_Line (">>> Changed_Callback for " & String (Prj.Name));
   end Changed_Callback;

   -------------
   -- Display --
   -------------

   procedure Display (Att : Project.Attribute.Object) is
   begin
      Put_Indent;
      Text_IO.Put (Image (Att.Name.Id));

      if Att.Has_Index then
         Text_IO.Put (" (" & Att.Index.Text & ")");
      end if;

      Text_IO.Put (" ->");

      for V of Att.Values loop
         Text_IO.Put (" " & V.Text);
      end loop;
      Text_IO.New_Line;
   end Display;

   procedure Display (Var : Project.Variable.Object) is
   begin
      Put_Indent;
      Text_IO.Put (String (Var.Name.Text) & " =");
      for V of Var.Values loop
         Text_IO.Put (" " & V.Text);
      end loop;
      Text_IO.New_Line;
   end Display;

   procedure Display (Prj : Project.View.Object) is
      use GPR2.Project.Attribute.Set;
      use GPR2.Project.Variable.Set.Set;
   begin
      Text_IO.Put_Line ('[' & String (Prj.Name) & "] " & Prj.Qualifier'Img);
      Indent := Indent + 3;

      for I of Prj.Imports loop
         Put_Indent;
         Text_IO.Put ("with       ");
         Indent := Indent + 3;
         Display (I);
         Indent := Indent - 3;
      end loop;

      if Prj.Is_Extending then
         Put_Indent;
         Text_IO.Put ("extends   ");
         Indent := Indent + 3;
         Display (Prj.Extended_Root);
         Indent := Indent - 3;
      end if;

      for A of Prj.Attributes loop
         Display (A);
      end loop;

      for V of Prj.Variables loop
         Display (V);
      end loop;

      for Pck of Prj.Packages loop
         Put_Indent;
         Text_IO.Put_Line ("Pck:   " & Image (Pck.Name));
         Indent := Indent + 3;
         for A of Pck.Attributes loop
            Display (A);
         end loop;

         for Var of Pck.Variables loop
            Display (Var);
         end loop;
         Indent := Indent - 3;
      end loop;

      if Prj.Kind in Aggregate_Kind then
         for Agg of Prj.Aggregated loop
            Put_Indent;
            Text_IO.Put ("aggregates ");
            Indent := Indent + 3;
            Display (Agg);
            Indent := Indent - 3;
         end loop;
      end if;

      Text_IO.New_Line;
      Indent := Indent - 3;
   end Display;

   Prj : Project.Tree.Object;
   Ctx : Context.Object;

begin
   Project.Tree.Load (Prj, Create ("agg.gpr"), Ctx);

   Display (Prj.Root_Project);
end Main;
