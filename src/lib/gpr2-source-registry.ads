------------------------------------------------------------------------------
--                                                                          --
--                           GPR2 PROJECT MANAGER                           --
--                                                                          --
--         Copyright (C) 2016-2017, Free Software Foundation, Inc.          --
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

with Ada.Containers.Ordered_Maps;

private package GPR2.Source.Registry is

   type Data is record
      Path_Name  : Path_Name_Type;
      Language   : Unbounded_String;
      Unit_Name  : Unbounded_String;
      Kind       : Kind_Type;
      Other_Part : Path_Name_Type;
      Units      : Source_Reference.Set.Object;
      Parsed     : Boolean := False;
   end record;

   package Source_Store is
     new Ada.Containers.Ordered_Maps (Path_Name_Type, Data);

   protected Shared is

      procedure Register (Def : Data);
      --  Register element in Store

      function Get (Object : Source.Object) return Data;
      --  Get the source data for the given source object

      procedure Set (Object : Source.Object; Def : Data);
      --  Set the source data for the given source object

      procedure Set_Other_Part (Object1, Object2 : Object);
      --  Register that Def1 is the other part for Def2 and the other way
      --  around too.

   private
      Store : Source_Store.Map;
   end Shared;

end GPR2.Source.Registry;
