echo off
setlocal enabledelayedexpansion

@REM Client Path 996M2/dev
set SOURCE_PATH="..\..\Client\dev\Skywalker\Source\"

if "%1"=="1" (
    echo Clear the client Skywalker\Source folder
    rmdir /s /q %SOURCE_PATH%
)

@REM Python
set PYTHON=py

@REM Script
set SCRIPT=convert_encoding.py

set FOLDER=../Client
set EXTENSIONS=lua
set ENCODING=utf-8
@REM Execute the script
%PYTHON% %SCRIPT% "!FOLDER!" "!EXTENSIONS!" "!ENCODING!"
@REM Copy the files
xcopy /s /e /y ..\Client\Skywalker %SOURCE_PATH%
xcopy /s /e /y ..\Client\API %SOURCE_PATH%API\

@REM Framework
set FOLDER=../Framework
set EXTENSIONS=lua
set ENCODING=utf-8
@REM Execute the script
%PYTHON% %SCRIPT% "!FOLDER!" "!EXTENSIONS!" "!ENCODING!"
@REM Copy the files
xcopy /s /e /y ..\Framework %SOURCE_PATH%Framework\
