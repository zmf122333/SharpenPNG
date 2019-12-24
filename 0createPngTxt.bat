@echo off&setlocal enabledelayedexpansion
set type=png
set DestPath=D:\proj.unity\Assets


if exist "%~dp0/%type%.txt" (del "%~dp0/%type%.txt") else set 1=1

set DestExt=*.%type%

for /f "delims=" %%i   in ('dir  /b/a-d/s  %DestPath%\%DestExt%')  do (
 for %%j in ("%%i") do echo %%~dpxnj>> %~dp0/%type%.txt
)