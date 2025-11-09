@echo off
IF NOT ("%UNDOPATH_1%") == ("") (
	SET PATH=%UNDOPATH_1%
) ELSE (
	SET PATH=%UNDO_PATH%
)
