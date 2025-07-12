echo off

set SrcOutputDir=.\NetMessage

set WORKSPACE=.
set LUBAN_DLL=%WORKSPACE%\..\Luban\Luban.dll

dotnet %LUBAN_DLL% ^
    -t all ^
    -c lua-lua ^
    --conf %WORKSPACE%\luban.conf ^
    -x outputCodeDir=%SrcOutputDir%

@REM Python
set PYTHON=py

@REM Script
set SCRIPT=..\PythonTool\convert_encoding.py

set EXTENSIONS=lua
set ENCODING=GB2312

@REM Execute the script
%PYTHON% %SCRIPT% "%SrcOutputDir%" "%EXTENSIONS%" "%ENCODING%"

@REM Copy the %SrcOutputDir% contents
xcopy /s /e /y %SrcOutputDir% ..\..\MirServer\Mir200\Envir\Skywalker\NetMessage\

set ENCODING=utf-8

@REM Execute the script
%PYTHON% %SCRIPT% "%SrcOutputDir%" "%EXTENSIONS%" "%ENCODING%"

@REM Copy the %SrcOutputDir% contents
xcopy /s /e /y %SrcOutputDir% ..\..\Client\dev\Skywalker\NetMessage\

@REM Copy the %SrcOutputDir% to ..\..\996Skywalker\NetMessage\
xcopy /s /e /y %SrcOutputDir% ..\..\996Skywalker\NetMessage\

@REM Delete the %SrcOutputDir% folder
rmdir /s /q %SrcOutputDir%
