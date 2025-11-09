@echo off
setlocal

SET /P AA=Input A:

set EC=0
IF "%AA%" == "" ( set EC=1. echo AA is empty ) else ( echo AA is %AA% ) 

echo EC=%EC%
