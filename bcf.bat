@echo off

echo %DATE% %TIME% : Start to build dev meta files [ cscope.files, cscope.out, tags ]

rem set MINGW_HOME=D:\Programs\msys64\mingw64
set ZMQ_HOME=D:\Programs\glibc\glibc

setlocal enableDelayedExpansion

pushd .

set /a idx=0

rem	ctags -R --c++-kinds=+p --extra=+q --fields=+l --language-force=C++ -h ".h.H.hh.hpp.hxx.h++.c.cpp.cxx" --exclude=tags --exclude=*~,*bak -L cscope.files
FOR %%d IN (
	%MINGW_HOME%
	%ZMQ_HOME%
	%CD%
) DO (

	set /a idx=!idx!+1
	echo !DATE! !TIME! : !idx! - Build dev files started : %%d "
	set CDF=%%d\cscope.out

	set "GEN="
	IF %%d == %CD% set GEN=1
	IF NOT EXIST !CDF! SET GEN=1

	IF DEFINED GEN (
		cd /d %%d

		echo !DATE! !TIME! :    1. do cscope files
		dir /b /s %%d | findstr "\.c$ \.cpp$ \.h$ \.hpp$ \.cxx$" > cscope.files
		echo !DATE! !TIME! :    1. done cscope files

		echo !DATE! !TIME! :    2. do cscope db
		cscope -b
		echo !DATE! !TIME! :    2. done cscope db

		echo !DATE! !TIME! :    3. do tags
		ctags --languages="c++,c" -R *
		echo !DATE! !TIME! :    3. done tags

	) ELSE (
		echo !DATE! !TIME! ;    9. already exist : !CDF!
	)
rem rem	if exist (%tf%) goto end_each_cscope 
rem 	cd /d %%d
rem 	(set STAMP=%DATE% %TIME%)
rem 	echo "%STAMP% : !idx! : 1. create cscope files : %%d"
rem 	dir /b /s %%d | findstr "\.c$ \.cpp$ \.h$ \.hpp$ \.cxx$" > cscope.files
rem rem rem	dir /b /s %MINGW_HOME% | findstr ".*\.[ch]$" > cscope.files
rem 	(set STAMP=%DATE% %TIME%)
rem 	echo "%STAMP% : !idx! : 2. build cscope db : %%d"
rem 	cscope -b
rem rem	:end_each_cscope
rem 
rem 	(set STAMP=%DATE% %TIME%)
rem 	echo "%STAMP% : !idx! : 3. build tags : %%d"
rem rem	ctags -R --c++-kinds=+p --extra=+q --fields=+l --language-force=C++ -h ".h.H.hh.hpp.hxx.h++.c.cpp.cxx" --exclude=tags --exclude=*~,*bak -L cscope.files
rem 	ctags --languages="c++,c" -R *
)

endlocal

popd

echo %DATE% %TIME% : Complete to build dev meta files [ cscope.files, cscope.out, tags ]


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


