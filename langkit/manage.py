#! /usr/bin/env python

import os.path

from os import listdir
from datetime import date

# Set the environment
from env import setenv
setenv()

from langkit.libmanage import ManageScript


class Manage(ManageScript):

    def __init__(self):
        super(Manage, self).__init__()

    def create_context(self, args):
        # Keep these import statements here so that they are executed only
        # after the coverage computation actually started.
        from langkit.compile_context import CompileCtx
        from language.parser import gpr_grammar
        from language.parser.lexer import gpr_lexer

        return CompileCtx(lang_name='GPR',
                          lexer=gpr_lexer,
                          grammar=gpr_grammar,
                          lib_name='GPR_Parser',
                          verbosity=args.verbosity)

ada_header = """
------------------------------------------------------------------------------
--                                                                          --
--                            GPR PROJECT PARSER                            --
--                                                                          --
--            Copyright (C) 2015-%4d, Free Software Foundation, Inc.       --
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

"""

c_header = """
/*----------------------------------------------------------------------------
--                                                                          --
--                            GPR PROJECT PARSER                            --
--                                                                          --
--            Copyright (C) 2015-%4d, Free Software Foundation, Inc.       --
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
----------------------------------------------------------------------------*/

/*  DO NOT EDIT THIS IS AN AUTOGENERATED FILE */

"""

if __name__ == '__main__':
    m = Manage()
    m.run()

    gpr_parser_files = os.path.join(
        m.dirs.root_build_dir, 'include', 'gpr_parser')

    for filename in listdir(gpr_parser_files):
        extension = os.path.splitext(filename)[1]
        basename = os.path.basename(filename)
        header = ""

        if extension == ".ads" or extension == ".adb":
            header = ada_header
        elif extension == ".c" or extension == ".h":
            header = c_header

        if header != "":
            header = header % date.today().year

            filepath = os.path.join(gpr_parser_files, filename)
            with open(filepath) as f:
                old_content = f.read()

            with open(filepath, 'w') as f:
                f.write(header)
                f.write(old_content)
