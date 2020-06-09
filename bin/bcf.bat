@echo off
echo ########## Start to build cscope database ##########

pushd .

setlocal 

set MINGW_HOME=D:\Programs\mingw64\mingw64
set ZMQ_HOME=D:\Dev\git\libzmq

if exist (%MINGW_HOME%\cscope.out) goto end_mingw 
cd /d %MINGW_HOME%
dir /b /s %MINGW_HOME% | findstr ".*\.[ch]$" > cscope.files
cscope -b -i cscope.files
:end_mingw

if exist (%ZMQ_HOME%\cscope.out) goto end_zmq 
cd /d %ZMQ_HOME%
dir /b /s %ZMQ_HOME%\include | findstr ".*\.[ch]$" > cscope.files
cscope -b -i cscope.files
:end_zmq

popd

if exist (cscope.out) goto end_cwd 
dir /b /s * | findstr ".*\.[ch]$" > cscope.files
cscope -b -i cscope.files
:end_cwd

pushd .

if not exist (%1) goto end_other
if exist (%1\cscope.out) goto end_other
cd /d %1
dir /b /s %1|findstr ".*\.[ch]$" > cscope.files
cscope -b -i cscope.files
:end_other

endlocal

popd

echo ########## Complete to build cscopew database ##########
