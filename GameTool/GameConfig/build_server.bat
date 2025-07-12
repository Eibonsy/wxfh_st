echo off

set DataOutputDir=.\Server\GameConfig\Data
set SrcOutputDir=.\Server\GameConfig\Src

set WORKSPACE=.
set LUBAN_DLL=%WORKSPACE%\..\Luban\Luban.dll

dotnet %LUBAN_DLL% ^
    -t server ^
    -d lua ^
    -c lua-lua ^
    --conf %WORKSPACE%\luban.conf ^
    -x outputDataDir=%DataOutputDir% ^
    -x outputCodeDir=%SrcOutputDir%

@REM Python
set PYTHON=py

@REM Script
set SCRIPT=..\PythonTool\convert_encoding.py

set FOLDER=.\Server
set EXTENSIONS=lua
set ENCODING=GB2312
@REM Execute the script
%PYTHON% %SCRIPT% "%FOLDER%" "%EXTENSIONS%" "%ENCODING%"
@REM Copy the %FOLDER% contents
xcopy /s /e /y %FOLDER% ..\..\MirServer\Mir200\Envir\Skywalker\

set ENCODING=utf-8
@REM Execute the script
%PYTHON% %SCRIPT% "%FOLDER%" "%EXTENSIONS%" "%ENCODING%"
xcopy /s /e /y %FOLDER%\GameConfig\Src\ ..\..\996Skywalker\GameConfig\Server\

@REM Delete the %FOLDER% folder
rmdir /s /q %FOLDER%
