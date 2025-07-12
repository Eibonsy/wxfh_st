echo off

set DataOutputDir=.\Client\GameConfig\Data
set SrcOutputDir=.\Client\GameConfig\Src

set WORKSPACE=.
set LUBAN_DLL=%WORKSPACE%\..\Luban\Luban.dll

dotnet %LUBAN_DLL% ^
    -t client ^
    -d lua ^
    -c lua-lua ^
    --conf %WORKSPACE%\luban.conf ^
    -x outputDataDir=%DataOutputDir% ^
    -x outputCodeDir=%SrcOutputDir%

@REM Python
set PYTHON=py

@REM Script
set SCRIPT=..\PythonTool\convert_encoding.py

set FOLDER=.\Client
set EXTENSIONS=lua
set ENCODING=utf-8
@REM Execute the script
%PYTHON% %SCRIPT% "%FOLDER%" "%EXTENSIONS%" "%ENCODING%"
xcopy /s /e /y %FOLDER% ..\..\Client\dev\Skywalker\
xcopy /s /e /y %FOLDER%\GameConfig\Src\ ..\..\996Skywalker\GameConfig\Client\

@REM Delete the %FOLDER% folder
rmdir /s /q %FOLDER%
