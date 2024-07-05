@echo off

IF [%1]==[] echo First Argument is NULL

rem IF NOT DEFINED AAAA (
rem

rem SET RS="_____"
SET RS=
echo 1.
IF ("%AAAA%") NEQ ("") (
	echo 2.1
   	SET RS=%AAAA%
	echo 2.2
) ELSE if ("%AAAA%") EQU ("aa") (
	echo 3.1
	SET RS=aa
	echo 3.2
) ELSE ( 
	echo 4.1
	SET RS=bbb
	echo 4.2
)

echo %RS%

