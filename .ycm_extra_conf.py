# This file is NOT licensed under the GPLv3, which is the license for the rest
# of YouCompleteMe.
#
# Here's the license text for this file:
#
# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org/>

import platform
import os
import os.path as p
import subprocess
import ycm_core

DIR_OF_THIS_SCRIPT = p.abspath( p.dirname( __file__ ) )
DIR_OF_THIRD_PARTY = p.join( DIR_OF_THIS_SCRIPT, 'third_party' )
SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]


# def FlagsForFile( filename ):
  # dirname = os.path.dirname(filename)
  # flags = {'flags': [
                      # '--std=gnu89', 
                      # '-MMD', 
                      # '-Wall', 
                      # '-fms-extensions', 
                      # '-Wno-multichar', 
                      # '-g3', '-mavx', 
                      # '-I', '/usr/include/infiniband', 
                      # '-I-', '.', 
                      # '-I' '../include', 
                      # '-I', dirname, 
                      # '-I', dirname + '/../include'
# 
def FlagsForFile( filename ):
  dirname = os.path.dirname(filename)
  flags = {'flags': [
       '-x', 'c++',
       '-Wall',
       '-Wextra',
       '-Werror',
       '-Wno-long-long',
       '-Wno-variadic-macros',
       '-fexceptions',
       '-DNDEBUG',
       # You 100% do NOT need -DUSE_CLANG_COMPLETER and/or -DYCM_EXPORT in your flags;
       # only the YCM source code needs it.
       '-DUSE_CLANG_COMPLETER',
       '-DYCM_EXPORT=',
       # THIS IS IMPORTANT! Without the '-x' flag, Clang won't know which language to
       # use when compiling headers. So it will guess. Badly. So C++ headers will be
       # compiled as C headers. You don't want that so ALWAYS specify the '-x' flag.
       # For a C project, you would set this to 'c' instead of 'c++'.
       '-target', 'x86_64-pc-windows-gnu++',
#       '-nostdinc++',
       '-isystem', 'cpp/pybind11',
       '-isystem', 'cpp/BoostParts',
       # '-isystem', get_python_inc(),
       '-I', dirname,
       '-I', dirname + '/../include',
       '-I', dirname + '/include',
       '-isystem', 'cpp/llvm/include',
       '-isystem', 'cpp/llvm/tools/clang/include',
       '-I', 'cpp/ycm',
       '-I', 'cpp/ycm/ClangCompleter',
       '-isystem', 'cpp/ycm/tests/gmock/gtest',
       '-isystem', 'cpp/ycm/tests/gmock/gtest/include',
       '-isystem', 'cpp/ycm/tests/gmock',
       '-isystem', 'cpp/ycm/tests/gmock/include',
       '-isystem', 'cpp/ycm/benchmarks/benchmark/include',
       '-isystem', 'C:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include',
       '-isystem', 'C:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++',
       '-isystem', 'C:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include-fixed',
       '-isystem', 'C:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/finclude',
       '-isystem', 'C:/Programs/mingw-w64/mingw64/x86_64-w64-mingw32/include',
       #'-isystem', 'C:/Programs/LLVM/lib/clang/9.0.0/include',
       #'-isystem', 'C:/Programs/MSVS/2017/Community/VC/Tools/MSVC/14.16.27023/ATLMFC/include',
       #'-isystem', 'C:/Programs/MSVS/2017/Community/VC/Tools/MSVC/14.16.27023/include',
       #'-isystem', 'C:/Windows Kits/10/include/10.0.17763.0/ucrt',
       #'-isystem', 'C:/Windows Kits/10/include/10.0.17763.0/shared',
       #'-isystem', 'C:/Windows Kits/10/include/10.0.17763.0/um',
       #'-isystem', 'C:/Windows Kits/10/include/10.0.17763.0/winrt',
       #'-isystem', 'C:/Windows Kits/10/include/10.0.17763.0/cppwinrt',
        ],
    'do_cache': True
    }
  return flags


# Clang automatically sets the '-std=' flag to 'c++14' for MSVC 2015 or later,
# which is required for compiling the standard library, and to 'c++11' for older
# versions.
if platform.system() != 'Windows':
  flags.append( '-std=c++11' )

# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# You can get CMake to generate this file for you by adding:
#   set( CMAKE_EXPORT_COMPILE_COMMANDS 1 )
# to your CMakeLists.txt file.
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''

if os.path.exists( compilation_database_folder ):
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None


def IsHeaderFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.h', '.hxx', '.hpp', '.hh' ]


def FindCorrespondingSourceFile( filename ):
  if IsHeaderFile( filename ):
    basename = os.path.splitext( filename )[ 0 ]
    for extension in SOURCE_EXTENSIONS:
      replacement_file = basename + extension
      if os.path.exists( replacement_file ):
        return replacement_file
  return filename


def Settings( **kwargs ):
  if kwargs[ 'language' ] == 'cfamily':
    # If the file is a header, try to find the corresponding source file and
    # retrieve its flags from the compilation database if using one. This is
    # necessary since compilation databases don't have entries for header files.
    # In addition, use this source file as the translation unit. This makes it
    # possible to jump from a declaration in the header file to its definition
    # in the corresponding source file.
    filename = FindCorrespondingSourceFile( kwargs[ 'filename' ] )

    if not database:
      return {
        'flags': flags,
        'include_paths_relative_to_dir': DIR_OF_THIS_SCRIPT,
        'override_filename': filename
      }

    compilation_info = database.GetCompilationInfoForFile( filename )
    if not compilation_info.compiler_flags_:
      return {}

    # Bear in mind that compilation_info.compiler_flags_ does NOT return a
    # python list, but a "list-like" StringVec object.
    final_flags = list( compilation_info.compiler_flags_ )

    # NOTE: This is just for YouCompleteMe; it's highly likely that your project
    # does NOT need to remove the stdlib flag. DO NOT USE THIS IN YOUR
    # ycm_extra_conf IF YOU'RE NOT 100% SURE YOU NEED IT.
    try:
      final_flags.remove( '-stdlib=libc++' )
    except ValueError:
      pass

    return {
      'flags': final_flags,
      'include_paths_relative_to_dir': compilation_info.compiler_working_dir_,
      'override_filename': filename
    }
  return {}


def GetStandardLibraryIndexInSysPath( sys_path ):
  for index, path in enumerate( sys_path ):
    if p.isfile( p.join( path, 'os.py' ) ):
      return index
  raise RuntimeError( 'Could not find standard library path in Python path.' )


def PythonSysPath( **kwargs ):
  sys_path = kwargs[ 'sys_path' ]

  dependencies = [ p.join( DIR_OF_THIS_SCRIPT, 'python' ),
                   p.join( DIR_OF_THIRD_PARTY, 'requests-futures' ),
                   p.join( DIR_OF_THIRD_PARTY, 'ycmd' ),
                   p.join( DIR_OF_THIRD_PARTY, 'requests_deps', 'idna' ),
                   p.join( DIR_OF_THIRD_PARTY, 'requests_deps', 'chardet' ),
                   p.join( DIR_OF_THIRD_PARTY, 'requests_deps', 'urllib3', 'src' ),
                   p.join( DIR_OF_THIRD_PARTY, 'requests_deps', 'certifi' ),
                   p.join( DIR_OF_THIRD_PARTY, 'requests_deps', 'requests' ) ]

  # The concurrent.futures module is part of the standard library on Python 3.
  interpreter_path = kwargs[ 'interpreter_path' ]
  major_version = int( subprocess.check_output( [
    interpreter_path, '-c', 'import sys; print( sys.version_info[ 0 ] )' ]
  ).rstrip().decode( 'utf8' ) )
  if major_version == 2:
    dependencies.append( p.join( DIR_OF_THIRD_PARTY, 'pythonfutures' ) )

  sys_path[ 0:0 ] = dependencies
  sys_path.insert( GetStandardLibraryIndexInSysPath( sys_path ) + 1,
                   p.join( DIR_OF_THIRD_PARTY, 'python-future', 'src' ) )

  return sys_path
