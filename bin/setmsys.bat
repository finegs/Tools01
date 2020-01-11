@echo off
SET MSYS_HOME=D:\Programs\msys64

SET UNDOPATH_1=%PATH%

call setMinGW.bat

SET UNDOPATH=%PATH%
SET PATH=%MSYS_HOME%\usr\bin;%MSYS_HOME%;%PATH%
SET REDOPATH=%PATH%
rem cd /D C:\Work\workspace\pjt01
rem start /b cmd.exe
rem start cmd.exe
