@echo off
rem #################### Input DEV_HOME Path from user ###

SET /P DEV_HOME=Enter DEV_HOME(ex C:\Dev) : 

IF "%DEV_HOME%" == "" (set EXIT_CODE=1. GOTO :Error)

SET DEV_GIT_HOME=%DEV_HOME%/git
SET DEV_GIT_TOOLS_HOME=%DEV_GIT_HOME%/Tools02

SET DEV_UTIL_BIN=C:/Programs/bin

rem #################### Cloning Git ###################
echo 1.1 Staring clone dev util from http://github.com/finegs/Tools02.git

git clone https://github.com/finegs/Tools02.git Tools02

echo 1.2 Completed clone dev util from http://github.com/finegs/Tools02.git
echo.
rem ####################################################


rem #################### Set dev env variables #########

echo.
echo 2.1 Set Dev Env Variables

rem TODO : for /f %f in ('dir /b') do (...)

mklink %DEV_UTIL_BIN%/setMinGW.bat %DEV_GIT_TOOLS_HOME%/bin/setMinGW.bat
mklink %DEV_UTIL_BIN%/setMsys.bat %DEV_GIT_TOOLS_HOME%/bin/setMsys.bat

rem ####################################################

rem ################## Exit with Successfully result ###
set EXIT_CODE=0
exit /b %EXIT_CODE%


rem ################## Exit with Error #################
:Error
echo Exit with Error(%EXIT_CODE%)
exit /b %EXIT_CODE%
rem ####################################################

