@echo off
set MINGW_HOME=C:\Programs\mingw-w64\mingw64
set MSYS_HOME=C:\Programs\msys64
set MY_DLL_HOME=C:\Dev\git\Exec04\Exec04\alogger
PATH=%MY_DLL_HOME%;%MINGW_HOME%\bin;%MSYS_HOME%\bin;%MSYS_HOME%\usr\bin;%PATH%
cd C:\
cd C:\Programs\eclipse\jee-2018-12\eclipse
start /b eclipse