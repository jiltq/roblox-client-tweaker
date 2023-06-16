# roblox client tweaker
a thingie that tweaks your client

## how does it work?
the batch file `RobloxClientTweaker.bat` does the following things:

1) sees what the latest version of roblox is from https://clientsettings.roblox.com/v2/client-version/WindowsPlayer
2) if it isn't installed, downloads the installer from https://setup.rbxcdn.com/Roblox.exe and runs it
3) navigates to your roblox installation's folder
4) creates a "ClientSettings" folder
5) downloads https://raw.githubusercontent.com/jiltq/roblox-client-tweaker/main/ClientAppSettings.json as `ClientAppSettings.json`

that's it! super unintrusive, super lightweight.

## installation
open up a **powershell ≥3.0** window and run:

```powershell
Invoke-WebRequest https://github.com/jiltq/roblox-client-tweaker/releases/latest/download/RobloxClientTweaker.bat -OutFile "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\RobloxClientTweaker.bat";cd "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup";.\RobloxClientTweaker.bat;exit
```

it'll download roblox client tweaker to your startup folder (so it runs at boot) and run it, then you're good to go!

## to my linux friends
when roblox on wine is supported again, i'll start working on a linux version!
