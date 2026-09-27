@echo off
rem Play breakout. Double-click this, or run it from a terminal.
rem
rem The generated .godot cache is not committed, so a fresh clone has none and
rem the engine will not start until it has been imported once. This does that
rem automatically rather than making it a step to remember.

setlocal
cd /d "%~dp0"

set "GODOT=%~dp0Godot_v4.7.2-stable_win64.exe"
set "GODOT_CONSOLE=%~dp0Godot_v4.7.2-stable_win64_console.exe"

if not exist "%GODOT%" (
	echo Cannot find %GODOT%
	echo The engine is vendored in the repository root. If this is a fresh
	echo clone, the binary should be there; if not, fetch it before playing.
	exit /b 1
)

if not exist ".godot" (
	echo First run on this checkout - importing the project. This takes a moment...
	"%GODOT_CONSOLE%" --headless --path . --import
	if errorlevel 1 (
		echo Import failed. See the output above.
		exit /b 1
	)
	echo Import done.
)

"%GODOT%" --path .
