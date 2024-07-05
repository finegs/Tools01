@echo off

rem IF NOT DEFINED %MSYS_HOME% 
IF ("%MSYS_HOME%") == ("") (
	SET MSYS_HOME=D:\Programs\msys64
)
SET MINGW_HOME=%MSYS_HOME%\mingw64
SET BOOST_HOME=D:\Programs\boost\boost

SET BOOST_INC=%BOOST_HOME%\..\boost_inc
SET BOOST_LIB=%BOOST_HOME%\lib
rem
rem for cmake
SET BOOST_ROOT=%BOOST_HOME%
SET BOOST_INCLUDEDIR=%BOOST_ROOT%\..\boost_inc\boost
SET BOOST_LIBRARYDIR=%BOOST_ROOT%\lib

SET LLVM_HOME=D:\Programs\LLVM\LLVM
SET PYTHON_HOME=D:\Programs\\Python\Python
SET PYTHON_ROOT=%PYTHON_HOME%
SET CMAKE_HOME=D:\Programs\CMake

SET UNDO_PATH=%PATH%
SET UNDO_PATH_1=%PATH%
rem
rem PATH=%MINGW_HOME%\bin;%MSYS_HOME%\bin;%MSYS_HOME%\usr\bin;%LLVM_HOME%\bin;%PYTHON_HOME%;%PYTHON_HOME%\Scripts;%CMAKE_HOME%\bin;%PATH%
rem
PATH=%MINGW_HOME%\bin;%LLVM_HOME%\bin;%PYTHON_HOME%;%PYTHON_HOME%\Scripts;%CMAKE_HOME%\bin;%PATH%

SET REDO_PATH_1=%PATH%
SET REDO_PATH=%PATH%

rem cd /D C:\Work\workspace\pjt01
rem start /b cmd.exe
rem start cmd.exe
