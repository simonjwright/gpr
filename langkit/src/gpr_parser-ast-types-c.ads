
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






with Ada.Unchecked_Conversion;

with Interfaces;   use Interfaces;
with Interfaces.C; use Interfaces.C;

with GPR_Parser.Analysis.C;
use GPR_Parser.Analysis.C;
with GPR_Parser.AST.C;
use GPR_Parser.AST.C;

--  This package defines data types and subprograms to provide the
--  implementation of the exported C API for AST nodes subclasses.
--
--  Unless one wants to deal with C code, it is very likely that one needs to
--  use this package. Please refer to the C header if you want to use the C
--  API.

package GPR_Parser.AST.Types.C is


         



type gpr_env_element_array_Ptr is access Env_Element_Array_Access;

procedure gpr_env_element_array_dec_ref (A : Env_Element_Array_Access)
   with Export        => True,
        Convention    => C,
        External_name => "gpr_env_element_array_dec_ref";



      
      type gpr_env_element_Ptr is access Env_Element;


   ---------------------------------------
   -- Kind-specific AST node primitives --
   ---------------------------------------

   --  All these primitives return their result through an OUT parameter. They
   --  return a boolean telling whether the operation was successful (it can
   --  fail if the node does not have the proper type, for instance). When an
   --  AST node is returned, its ref-count is left as-is.

           

   

   function gpr_gpr_node_parent
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_gpr_node_parent";
   --  Return the lexical parent for this node. Return null for the root AST node
--  or for AST nodes for which no one has a reference to the parent.


           

   

   function gpr_gpr_node_parents
     (Node    : gpr_base_node;


      Value_P : gpr_gpr_node_array_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_gpr_node_parents";
   --  Return an array that contains the lexical parents (this node included).
--  Nearer parents are first in the list.


           

   

   function gpr_gpr_node_children
     (Node    : gpr_base_node;


      Value_P : gpr_gpr_node_array_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_gpr_node_children";
   --  Return an array that contains the direct lexical children


           

   

   function gpr_gpr_node_token_start
     (Node    : gpr_base_node;


      Value_P : gpr_token_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_gpr_node_token_start";
   --  Return the first token used to parse this node.


           

   

   function gpr_gpr_node_token_end
     (Node    : gpr_base_node;


      Value_P : gpr_token_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_gpr_node_token_end";
   --  Return the last token used to parse this node.


           

   

   function gpr_gpr_node_previous_sibling
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_gpr_node_previous_sibling";
   --  Return the node's previous sibling, if there is one


           

   

   function gpr_gpr_node_next_sibling
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_gpr_node_next_sibling";
   --  Return the node's next sibling, if there is one


           

   

   function gpr_attribute_decl_f_attr_name
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_attribute_decl_f_attr_name";
   


           

   

   function gpr_attribute_decl_f_attr_index
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_attribute_decl_f_attr_index";
   


           

   

   function gpr_attribute_decl_f_expr
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_attribute_decl_f_expr";
   


           

   

   function gpr_attribute_reference_f_attribute_name
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_attribute_reference_f_attribute_name";
   


           

   

   function gpr_attribute_reference_f_attribute_index
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_attribute_reference_f_attribute_index";
   


           

   

   function gpr_case_construction_f_var_ref
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_case_construction_f_var_ref";
   


           

   

   function gpr_case_construction_f_items
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_case_construction_f_items";
   


           

   

   function gpr_case_item_f_choice
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_case_item_f_choice";
   


           

   

   function gpr_case_item_f_decls
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_case_item_f_decls";
   


           

   

   function gpr_compilation_unit_f_project
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_compilation_unit_f_project";
   


           

   

   function gpr_prefix_f_prefix
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_prefix_f_prefix";
   


           

   

   function gpr_prefix_f_suffix
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_prefix_f_suffix";
   


           

   

   function gpr_single_tok_node_f_tok
     (Node    : gpr_base_node;


      Value_P : gpr_token_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_single_tok_node_f_tok";
   


           

   

   function gpr_expr_list_f_exprs
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_expr_list_f_exprs";
   


           

   

   function gpr_external_reference_f_kind
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_external_reference_f_kind";
   


           

   

   function gpr_external_reference_f_string_lit
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_external_reference_f_string_lit";
   


           

   

   function gpr_external_reference_f_expr
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_external_reference_f_expr";
   


           

   

   function gpr_package_decl_f_pkg_name
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_package_decl_f_pkg_name";
   


           

   

   function gpr_package_decl_f_pkg_spec
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_package_decl_f_pkg_spec";
   


           

   

   function gpr_package_extension_f_prj_name
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_package_extension_f_prj_name";
   


           

   

   function gpr_package_extension_f_pkg_name
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_package_extension_f_pkg_name";
   


           

   

   function gpr_package_renaming_f_prj_name
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_package_renaming_f_prj_name";
   


           

   

   function gpr_package_renaming_f_pkg_name
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_package_renaming_f_pkg_name";
   


           

   

   function gpr_package_spec_f_extension
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_package_spec_f_extension";
   


           

   

   function gpr_package_spec_f_decls
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_package_spec_f_decls";
   


           

   

   function gpr_package_spec_f_end_name
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_package_spec_f_end_name";
   


           

   

   function gpr_project_f_context_clauses
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_project_f_context_clauses";
   


           

   

   function gpr_project_f_project_decl
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_project_f_project_decl";
   


           

   

   function gpr_project_declaration_f_qualifier
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_project_declaration_f_qualifier";
   


           

   

   function gpr_project_declaration_f_project_name
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_project_declaration_f_project_name";
   


           

   

   function gpr_project_declaration_f_extension
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_project_declaration_f_extension";
   


           

   

   function gpr_project_declaration_f_decls
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_project_declaration_f_decls";
   


           

   

   function gpr_project_declaration_f_end_name
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_project_declaration_f_end_name";
   


           

   

   function gpr_project_extension_f_is_all
     (Node    : gpr_base_node;


      Value_P : gpr_bool_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_project_extension_f_is_all";
   


           

   

   function gpr_project_extension_f_path_name
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_project_extension_f_path_name";
   


           

   

   function gpr_project_qualifier_f_qualifier
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_project_qualifier_f_qualifier";
   


           

   

   function gpr_project_reference_f_attr_ref
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_project_reference_f_attr_ref";
   


           

   

   function gpr_qualifier_names_f_qualifier_id1
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_qualifier_names_f_qualifier_id1";
   


           

   

   function gpr_qualifier_names_f_qualifier_id2
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_qualifier_names_f_qualifier_id2";
   


           

   

   function gpr_string_literal_at_f_str_lit
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_string_literal_at_f_str_lit";
   


           

   

   function gpr_string_literal_at_f_at_lit
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_string_literal_at_f_at_lit";
   


           

   

   function gpr_term_list_f_terms
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_term_list_f_terms";
   


           

   

   function gpr_typed_string_decl_f_type_id
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_typed_string_decl_f_type_id";
   


           

   

   function gpr_typed_string_decl_f_string_literals
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_typed_string_decl_f_string_literals";
   


           

   

   function gpr_variable_decl_f_var_name
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_variable_decl_f_var_name";
   


           

   

   function gpr_variable_decl_f_var_type
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_variable_decl_f_var_type";
   


           

   

   function gpr_variable_decl_f_expr
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_variable_decl_f_expr";
   


           

   

   function gpr_variable_reference_f_variable_name1
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_variable_reference_f_variable_name1";
   


           

   

   function gpr_variable_reference_f_variable_name2
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_variable_reference_f_variable_name2";
   


           

   

   function gpr_variable_reference_f_attribute_ref
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_variable_reference_f_attribute_ref";
   


           

   

   function gpr_with_decl_f_is_limited
     (Node    : gpr_base_node;


      Value_P : gpr_bool_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_with_decl_f_is_limited";
   


           

   

   function gpr_with_decl_f_path_names
     (Node    : gpr_base_node;


      Value_P : gpr_base_node_Ptr) return int
      with Export        => True,
           Convention    => C,
           External_name => "gpr_with_decl_f_path_names";
   



end GPR_Parser.AST.Types.C;
