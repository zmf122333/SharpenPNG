@echo off&setlocal enabledelayedexpansion
set type=png
set kind=hd

set DestPath=C:\Users\Administrator\Desktop\sharpenning\%type%_%kind%\Assets
set DestExt=*.%type%

if exist "%~dp0/%type%_%kind%.txt" (del "%~dp0/%type%_%kind%.txt") else set 1=1


for /f "delims=" %%i   in ('dir  /b/a-d/s  %DestPath%\%DestExt%')  do (
 for %%j in ("%%i") do echo %%~dpxnj>> %~dp0/%type%_%kind%.txt
)