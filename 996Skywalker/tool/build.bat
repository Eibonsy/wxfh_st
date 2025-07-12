echo off

@REM Help
if "%1"=="Help" (
    goto show_help
)
if "%1"=="help" (
    goto show_help
)
if "%1"=="h" (
    goto show_help
)
goto continue

:show_help
echo Usage: build.bat [option]
echo Options:
echo   1 - Clear the server and client Skywalker folder
echo   Help - Show this help message
exit /b 0

:continue

@REM Execute build_server.bat
call build_server.bat %1

@REM Execute build_client.bat
call build_client.bat %1
