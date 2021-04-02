@echo off

rem call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat"
call  "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" amd64
rem call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsDevCmd.bat"

rem returns a non empty %API_ERR_TXT% if API env is not ok.
rem returns "cl" version in %CL_VER%: "VC10"
rem start with "x86" for 32 bit or "x64" for 64 bit (default)
set API_ROOT=C:\Siemens\Automation\WinCC_OA\3.14\api
set API_PLATFORM=x64
if "%1"=="x86" set API_PLATFORM=x86

set API_ERR_TXT=
IF "%API_ROOT%" == "" goto l_no_API_ROOT
IF NOT EXIST "%API_ROOT%\" goto l_ill_API_ROOT
echo found API_ROOT - good
set API_OK=1

call cl.exe 2>&1 | findstr /I /C:"Compiler Version 18.00">nul
rem call cl.exe 2>&1 | findstr /I /C:"19.16">nul
rem echo ERRORLEVEL:%ERRORLEVEL%
if %ERRORLEVEL% == 0 set CL_VER=VC10&goto l_vc12_env

rem VC10 german compiler has lower case 'compiler'
call cl.exe 2>&1 | findstr /I /C:"compiler Version 18.00">nul
rem call cl.exe 2>&1 | findstr /I /C:"19.16">nul
rem echo ERRORLEVEL:%ERRORLEVEL%
if %ERRORLEVEL% == 0 set CL_VER=VC10&goto l_vc12_env

set API_ERR_TXT=** cannot determine 'cl' compiler version! Maybe no compiler or wrong compiler version installed. VC12 expected.
goto l_errout

:l_vc12_env
echo found VC12 compiler - good

if %API_PLATFORM% == x64 goto l_vc12_x64_env
echo setting env for 32bit development
set VC8_DEFS=-DLIBS_AS_DLL -D_CRT_NON_CONFORMING_SWPRINTFS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -D_USE_32BIT_TIME_T -DNODEF__RPC_H__ -DWINVER=0x0500 -DUSES_NEW_IOSTREAMS -DPVSS_PLATFORM=\"%API_PLATFORM%\" -I%API_ROOT%/include/winnt/pvssincl/vc8 -I%API_ROOT%/include/winnt/pvssincl -EHsc
set API_INCL=.\;%API_ROOT%\include\winnt\pvssincl;%API_ROOT%\include\Basics\Utilities;%API_ROOT%\include\Basics\Variables;%API_ROOT%\include\Basics\NoPosix;%API_ROOT%\include\Basics\DpBasics;%API_ROOT%\include\BCMNew;%API_ROOT%\include\Configs;%API_ROOT%\include\Configs\DrvConfigs\DrvCommon;%API_ROOT%\include\Configs\DrvConfigs\ConvSmooth;%API_ROOT%\include\Datapoint;%API_ROOT%\include\Messages;%API_ROOT%\include\Manager;%API_ROOT%\include\ComDrv;%API_ROOT%\include\Ctrl
set API_LIB=%API_ROOT%\lib.winnt32\libCtrl.lib;%API_ROOT%\lib.winnt32\libComDrv.lib;%API_ROOT%\lib.winnt32\libManager.lib;%API_ROOT%\lib.winnt32\libMessages.lib;%API_ROOT%\lib.winnt32\libDatapoint.lib;%API_ROOT%\lib.winnt32\libConfigs.lib;%API_ROOT%\lib.winnt32\libBasics.lib;%API_ROOT%\lib.winnt32\libV24.lib;%API_ROOT%\lib.winnt32\bcm.lib;wsock32.lib;netapi32.lib
GOTO l_ex1

:l_vc12_x64_env
echo setting env for 64bit development
set VC8_DEFS=-DLIBS_AS_DLL -D_CRT_NON_CONFORMING_SWPRINTFS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DNODEF__RPC_H__ -DWINVER=0x0500 -DUSES_NEW_IOSTREAMS -DPVSS_PLATFORM=\"%API_PLATFORM%\" -I%API_ROOT%/include/winnt/pvssincl/vc8 -I%API_ROOT%/include/winnt/pvssincl -EHsc
set API_INCL=.\;%API_ROOT%\include\winnt\pvssincl;%API_ROOT%\include\Basics\Utilities;%API_ROOT%\include\Basics\Variables;%API_ROOT%\include\Basics\NoPosix;%API_ROOT%\include\Basics\DpBasics;%API_ROOT%\include\BCMNew;%API_ROOT%\include\Configs;%API_ROOT%\include\Configs\DrvConfigs\DrvCommon;%API_ROOT%\include\Configs\DrvConfigs\ConvSmooth;%API_ROOT%\include\Datapoint;%API_ROOT%\include\Messages;%API_ROOT%\include\Manager;%API_ROOT%\include\ComDrv;%API_ROOT%\include\Ctrl
set API_LIB=%API_ROOT%\lib.winnt\libCtrl.lib;%API_ROOT%\lib.winnt\libComDrv.lib;%API_ROOT%\lib.winnt\libManager.lib;%API_ROOT%\lib.winnt\libMessages.lib;%API_ROOT%\lib.winnt\libDatapoint.lib;%API_ROOT%\lib.winnt\libConfigs.lib;%API_ROOT%\lib.winnt\libBasics.lib;%API_ROOT%\lib.winnt\libV24.lib;%API_ROOT%\lib.winnt\bcm.lib;wsock32.lib;netapi32.lib
GOTO l_ex1

:l_no_API_ROOT
  set API_ERR_TXT=** Environment API_ROOT is not set !
  GOTO l_errout

:l_ill_API_ROOT
  set API_ERR_TXT=** Environment API_ROOT is not a directory !
  GOTO l_errout

:l_errout

IF "%1" == "-q" GOTO l_ex1
IF "%API_ERR_TXT%" == "" GOTO l_ex1
echo.
echo %API_ERR_TXT%
echo.

exit /B 1

:l_ex1
echo done

set D_PVSS_VER=-DPVSS_VER_314 -DPVSS_VERS=314000 "-DPVSS_VERS_DLL=\"314000\""
