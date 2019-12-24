@echo off&setlocal enabledelayedexpansion
set type=png
set DestPath=C:\Users\Administrator\Desktop\sharpenning\tga\Assets
set file=tga_alpha_png


if exist "%~dp0/%file%.txt" (del "%~dp0/%file%.txt") else set 1=1

set DestExt=*.%type%

for /f "delims=" %%i   in ('dir  /b/a-d/s  %DestPath%\%DestExt%')  do (
 for %%j in ("%%i") do echo %%~dpxnj>> %~dp0/%file%.txt
)