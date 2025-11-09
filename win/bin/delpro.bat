@echo off
IF ("%1") == ("") exit(1)
SET procname=%1
SET /P delProc=Kill Process : %procname%? (Y/N)
IF NOT ("%delProc%") == "Y" exit(0)

echo Delete Process : %procname%

wmic process where "name like '%%procname%%'" delete
