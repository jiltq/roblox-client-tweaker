@echo off

set "repo=jiltq/roblox-client-tweaker"
set "branch=main"

set "version=nothing"

set "tempFile=%temp%\data.json"

goto main

:wifiError
echo Roblox Client Tweaker :: No internet connection found! Retrying...
ping 127.0.0.1 -n 6 >nul
goto main

:versionError
echo Roblox Client Tweaker :: Please update your roblox client!
pause
exit /b

:main
cd /d "%LocalAppData%\Roblox\Versions"

certutil -urlcache -split -f "https://raw.githubusercontent.com/%repo%/%branch%/data.json" "%tempFile%" >nul

if %errorlevel% neq 0 (
goto wifiError
)

for /f "delims=" %%A in ('powershell -Command "(Get-Content -Raw '%tempFile%') | ConvertFrom-Json | Select-Object -ExpandProperty version"') do (
    set "version=%%A"
)
del "%tempFile%"

if not exist "%cd%\%version%" (
goto versionError
)

cd %version%

mkdir ClientSettings

certutil -urlcache -split -f "https://raw.githubusercontent.com/%repo%/%branch%/ClientAppSettings.json" "%cd%\ClientSettings\ClientAppSettings.json" >nul

if %errorlevel% neq 0 (
goto wifiError
)
