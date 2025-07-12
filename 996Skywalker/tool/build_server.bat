echo off
setlocal enabledelayedexpansion

@REM Server Path MirServer/Mir200/Envir/
set SOURCE_PATH="..\..\MirServer\Mir200\Envir\Skywalker\Source\"

if "%1"=="1" (
    echo Clear the server Skywalker\Source folder
    rmdir /s /q %SOURCE_PATH%
)

@REM Python
set PYTHON=py

@REM Script
set SCRIPT=convert_encoding.py

set FOLDER=../Server
set EXTENSIONS=lua
set ENCODING=GB2312
@REM Execute the script
%PYTHON% %SCRIPT% "!FOLDER!" "!EXTENSIONS!" "!ENCODING!"
@REM Copy the files
xcopy /s /e /y ..\Server\Skywalker\ %SOURCE_PATH%
xcopy /s /e /y ..\Server\API\ %SOURCE_PATH%API\
set ENCODING=utf-8
@REM Execute the script
%PYTHON% %SCRIPT% "!FOLDER!" "!EXTENSIONS!" "!ENCODING!"

@REM Framework
set FOLDER=../Framework
set EXTENSIONS=lua
set ENCODING=GB2312
@REM Execute the script
%PYTHON% %SCRIPT% "!FOLDER!" "!EXTENSIONS!" "!ENCODING!"
@REM Copy the files
xcopy /s /e /y ..\Framework %SOURCE_PATH%Framework\
set ENCODING=utf-8
@REM Execute the script
%PYTHON% %SCRIPT% "!FOLDER!" "!EXTENSIONS!" "!ENCODING!"
