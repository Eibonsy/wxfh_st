
echo off

@REM if GameConfig Exists, execute build.bat
if exist GameConfig (
    cd ./GameConfig
    call build.bat
    cd ..
)

@REM if GameMisc Exists, execute build.bat
if exist GameMisc (
    cd ./GameMisc
    call build.bat
    cd ..
)

@REM if NetMessage Exists, execute build.bat
if exist NetMessage (
    cd ./NetMessage
    call build.bat
    cd ..
)
