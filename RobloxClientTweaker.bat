@echo off

set "Repo=jiltq/roblox-client-tweaker"
set "Branch=main"

set "RobloxVersionFolder=%LocalAppData%\Roblox\Versions"
set "RobloxVersion=NA"

set "RobloxInstallerDownload=https://setup.rbxcdn.com/Roblox.exe"
set "RobloxInstallerFile=%temp%\RobloxInstaller.exe"

set "RobloxClientVersionDownload=https://clientsettings.roblox.com/v2/client-version/WindowsPlayer"
set "RobloxClientVersionFile=%temp%\RobloxClientVersion.json"

goto main

:WiFiError
echo Roblox Client Tweaker :: No internet connection found! Retrying...
ping 127.0.0.1 -n 6 >nul
goto main

:UpdateLoop
if not exist "%RobloxVersionFolder%\%RobloxVersion%" (
ping 127.0.0.1 -n 1 >nul
goto UpdateLoop
)
goto main

:UpdateClient
echo Roblox Client Tweaker :: Updating your client...
certutil -urlcache -split -f "%RobloxInstallerDownload%" "%RobloxInstallerFile%" >nul
if %errorlevel% neq 0 (
goto WiFiError
)
start "" "%RobloxInstallerFile%"
goto UpdateLoop

:main
certutil -urlcache -split -f "%RobloxClientVersionDownload%" "%RobloxClientVersionFile%" >nul

if %errorlevel% neq 0 (
goto WiFiError
)

for /f "delims=" %%A in ('powershell -Command "(Get-Content -Raw '%RobloxClientVersionFile%') | ConvertFrom-Json | Select-Object -ExpandProperty clientVersionUpload"') do (
    set "RobloxVersion=%%A"
)
del "%RobloxClientVersionFile%"

if not exist "%RobloxVersionFolder%\%RobloxVersion%" (
goto UpdateClient
)

if not exist "%RobloxVersionFolder%\%RobloxVersion%\ClientSettings" (
mkdir "%RobloxVersionFolder%\%RobloxVersion%\ClientSettings"
)

certutil -urlcache -split -f "https://raw.githubusercontent.com/%Repo%/%Branch%/ClientAppSettings.json" "%RobloxVersionFolder%\%RobloxVersion%\ClientSettings\ClientAppSettings.json" >nul

if %errorlevel% neq 0 (
goto WiFiError
)
