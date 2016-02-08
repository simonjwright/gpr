
------------------------------------------------------------------------------
--                                                                          --
--                            GPR PROJECT PARSER                            --
--                                                                          --
--            Copyright (C) 2015-2016, Free Software Foundation, Inc.       --
--                                                                          --
-- This library is free software;  you can redistribute it and/or modify it --
-- under terms of the  GNU General Public License  as published by the Free --
-- Software  Foundation;  either version 3,  or (at your  option) any later --
-- version. This library is distributed in the hope that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE.                            --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
------------------------------------------------------------------------------

--  DO NOT EDIT THIS IS AN AUTOGENERATED FILE


with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body GPR_Parser.AST.List is

   use Node_Vectors;

   ----------
   -- Kind --
   ----------

   overriding
   function Kind (Node : access List_Type) return GPR_Node_Type_Kind is
      pragma Unreferenced (Node);
   begin
      return List_Kind;
   end Kind;

   ---------------
   -- Kind_Name --
   ---------------

   overriding
   function Kind_Name (Node : access List_Type) return String is
      pragma Unreferenced (Node);
   begin
      return "ASTList";
   end Kind_Name;

   -----------
   -- Image --
   -----------

   overriding
   function Image (Node : access List_Type) return String is
      Result : Unbounded_String;
   begin
      Append (Result, '[');
      for El of Node.Vec loop
         if Length (Result) > 0 then
            Append (Result, ", ");
         end if;
         Append (Result, El.Image);
      end loop;

      Append (Result, ']');
      return To_String (Result);
   end Image;

   -----------------
   -- Child_Count --
   -----------------

   overriding
   function Child_Count (Node : access List_Type) return Natural
   is
   begin
      return Length (Node.Vec);
   end Child_Count;

   ---------------
   -- Get_Child --
   ---------------

   overriding
   procedure Get_Child (Node   : access List_Type;
                        Index  : Natural;
                        Exists : out Boolean;
                        Result : out GPR_Node)
   is
   begin
      if Index >= Length (Node.Vec) then
         Exists := False;
      else
         Exists := True;
         Result :=
           GPR_Node (Node_Vectors.Get_At_Index (Node.Vec, Index));
      end if;
   end Get_Child;

   -----------
   -- Print --
   -----------

   overriding
   procedure Print (Node  : access List_Type;
                    Level : Natural := 0) is
   begin
      if Length (Node.Vec) = 0 then
         return;
      end if;

      for Child of Node.Vec loop
         if Child /= null then
            Child.Print (Level);
         end if;
      end loop;
   end Print;

   ---------------------
   -- Lookup_Children --
   ---------------------

   overriding
   function Lookup_Children
     (Node : access List_Type;
      Sloc : Source_Location;
      Snap : Boolean := False)
      return GPR_Node
   is
   begin
      for Child of Node.Vec loop
         declare
            Position : Relative_Position;
            Result   : GPR_Node;
         begin
            Lookup_Relative (Child.all'Access, Sloc, Position, Result, Snap);
            case Position is
               when Before =>
                  return GPR_Node (Node);
               when Inside =>
                  return Result;
               when After =>
                  null;
            end case;
         end;
      end loop;
      return GPR_Node (Node);
   end Lookup_Children;

   -------------
   -- Destroy --
   -------------

   overriding procedure Destroy (Node : access List_Type) is
   begin
      Free_Extensions (Node);
      for N of Node.Vec loop
         Destroy (N);
      end loop;
   end Destroy;

end GPR_Parser.AST.List;
