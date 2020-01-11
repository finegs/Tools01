@echo off
if %MINGW_HOME% =="" goto Error

echo Backup current dir
SET CUR_DIR=%CD%
SET EXIT_CODE=0

echo Starting create ctags files...

echo.
rem ########### Current ##############
SET W_DIR=%CD%
echo 1. Creating ctags files : %W_DIR%
ctags -R --c++-kinds=+pldefstv --extra=+q --fields=+l .
echo 1.2. Done creating ctags files : %W_DIR%
rem ##################################

echo. 
rem ########### C include ############
SET W_DIR=%MINGW_HOME%/x86_64-w64-mingw32/include
echo 2.1 Creating ctags files : %W_DIR%
cd /d %W_DIR%
ctags -R --c++-kinds=+pldefstv --extra=+q --fields=+l .
echo 2.2 Done creating ctags files : %W_DIR%
rem ##################################

echo. 
rem ########## C++ Header ############
SET W_DIR=%MINGW_HOME%/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++
echo 3.1 Creating ctags files : %W_DIR%
cd /d %W_DIR%
ctags -R --c++-kinds=+pldefstv --extra=+q --fields=+l .
echo 3.2 Done creating ctags files : %W_DIR%
rem ##################################

echo. 
rem ########## Done ##################
echo 4.1 Creating ctags files is done successfully.
goto Exit
rem ##################################

rem ########## Error #################
:Error
echo. 
if EXIT_CODE == 1 (
	echo 4.2 Createing ctags files is failed. MINGW_HOME is empty : %EXIT_CODE%
) else ( 
	echo 4.2 Createing ctags files is failed. Unknown Error : %EXIT_CODE% 
)

SET EXIT_CODE=1
goto Exit

:Exit
echo. 
echo Return to startig path : %CUR_DIR%
cd /d %CUR_DIR%
exit /B %EXIT_CODE%

