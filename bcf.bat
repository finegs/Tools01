@echo off
set  (STAMP=%DATE% %TIME%)
echo ########## %STAMP% : Start to build dev meta files  cscope.files, cscope.out, tags ##########

set MINGW_HOME=D:\Programs\msys64\mingw64
set ZMQ_HOME=D:\Dev\git\libzmq

setlocal enableDelayedExpansion

pushd .

set /a idx=0

FOR %%d IN (
	%MINGW_HOME%
	%ZMQ_HOME%
	%CD%
) DO (

	(set STAMP=%DATE% %TIME%)
	echo "%STAMP% : build dev files startd : %%d "
rem	set /a idx=!idx!+1
	set tf=%%d\cscope.out
rem	if exist (%tf%) goto end_each_cscope 
	cd /d %%d
	(set STAMP=%DATE% %TIME%)
	echo "%STAMP% : !idx! : 1. create cscope files : %%d"
	dir /b /s %%d | findstr "\.c$ \.cpp$ \.h$ \.hpp$ \.cxx$" > cscope.files
rem rem	dir /b /s %MINGW_HOME% | findstr ".*\.[ch]$" > cscope.files
	(set STAMP=%DATE% %TIME%)
	echo "%STAMP% : !idx! : 2. build cscope db : %%d"
	cscope -b
rem	:end_each_cscope

	(set STAMP=%DATE% %TIME%)
	echo "%STAMP% : !idx! : 3. build tags : %%d"
	ctags -R --c++-kinds=+p --extra=+q --fields=+l --language-force=C++ -h ".h.H.hh.hpp.hxx.h++.c.cpp.cxx" --exclude=tags --exclude=*~,*bak -L cscope.files
)

endlocal

popd

(set STAMP=%DATE% %TIME%)
echo ########## %STAMP% : Complete to build cscopew database ##########


rem echo #############  old source ######################
rem if exist (%MINGW_HOME%\cscope.out) goto end_mingw 
rem cd /d %MINGW_HOME%
rem dir /b /s %MINGW_HOME% | findstr ".*\.[ch]$" > cscope.files
rem cscope -b -i cscope.files
rem :end_mingw
rem 
rem if exist (%ZMQ_HOME%\cscope.out) goto end_zmq 
rem cd /d %ZMQ_HOME%
rem dir /b /s %ZMQ_HOME%\include | findstr ".*\.[ch]$" > cscope.files
rem cscope -b -i cscope.files
rem :end_zmq
rem 
rem popd
rem 
rem if exist (cscope.out) goto end_cwd 
rem dir /b /s * | findstr ".*\.[ch]$" > cscope.files
rem cscope -b -i cscope.files
rem :end_cwd
rem 
rem pushd .
rem 
rem if not exist (%1) goto end_other
rem if exist (%1\cscope.out) goto end_other
rem cd /d %1
rem dir /b /s %1|findstr ".*\.[ch]$" > cscope.files
rem cscope -b -i cscope.files
rem :end_other


