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

import os.path as p
import subprocess

DIR_OF_THIS_SCRIPT = p.abspath( p.dirname( __file__ ) )
DIR_OF_THIRD_PARTY = p.join( DIR_OF_THIS_SCRIPT, 'third_party' )
SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]


# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
flags = [
'-Wall',
'-Wextra',
#'-Werror',
'-Wno-long-long',
'-Wno-variadic-macros',
'-fexceptions',
'-DNDEBUG',
# You 100% do NOT need -DUSE_CLANG_COMPLETER and/or -DYCM_EXPORT in your flags;
# only the YCM source code needs it.
'-DUSE_CLANG_COMPLETER',
'-DYCM_EXPORT=',
'-std=c++17',
#'-std=c++2a',
# THIS IS IMPORTANT! Without the '-x' flag, Clang won't know which language to
# use when compiling headers. So it will guess. Badly. So C++ headers will be
# compiled as C headers. You don't want that so ALWAYS specify the '-x' flag.
# For a C project, you would set this to 'c' instead of 'c++'.
'-x','c++',
'-isystem', 'cpp/pybind11',
'-isystem', 'cpp/BoostParts',
'-isystem', get_python_inc(),
#'-isystem','cpp/llvm/include',
#'-isystem','cpp/llvm/include/clang-c',
#'-isystem','cpp/llvm/tools/clang/include',
'-I','cpp/ycm',
'-I','cpp/ycm/ClangCompleter',
'-isystem','cpp/ycm/tests/gmock/gtest',
'-isystem','cpp/ycm/tests/gmock/gtest/include',
'-isystem','cpp/ycm/tests/gmock',
'-isystem','cpp/ycm/tests/gmock/include',
'-isystem','cpp/ycm/benchmarks/benchmark/include',
'-isystem','D:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++', 
'-isystem','D:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/x86_64-w64-mingw32', 
'-isystem','D:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/backward', 
'-isystem','D:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include', 
'-isystem','D:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include-fixed', 
'-isystem','D:/Programs/mingw-w64/mingw64/x86_64-w64-mingw32/include', 
'-Isystem','D:/Programs/boost/boost_inc',
'-Isystem','.', 
]

# Clang automatically sets the '-std=' flag to 'c++14' for MSVC 2015 or later,
# which is required for compiling the standard library, and to 'c++11' for older
# versions.
#if platform.system() != 'Windows':
#  flags.append( '-std=c++17' )
#else:
#  flags.append( '-std=c++17' )


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
                   p.join( DIR_OF_THIRD_PARTY,
                           'requests_deps',
                           'urllib3',
                           'src' ),
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
