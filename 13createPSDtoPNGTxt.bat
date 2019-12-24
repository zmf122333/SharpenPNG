@echo off&setlocal enabledelayedexpansion
set type=png
set file=psd_png

if exist "%~dp0/%file%.txt" (del "%~dp0/%file%.txt") else set 1=1

set DestPath=C:\Users\Administrator\Desktop\sharpenning\psd\Assets
set DestExt=*.%type%

for /f "delims=" %%i   in ('dir  /b/a-d/s  %DestPath%\%DestExt%')  do (
 for %%j in ("%%i") do echo %%~dpxnj>> %~dp0/%file%.txt
)