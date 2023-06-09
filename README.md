# roblox client tweaker
a thingie that tweaks your client

## how does it work?
the batch file `RobloxClientTweaker.bat` does the following things:

1) navigates to your roblox installation's "Versions" folder
2) fetches https://clientsettings.roblox.com/v2/client-version/WindowsPlayer to get the latest client version
3) if you have the latest version, it navigates into that version
4) it creates the "ClientSettings" folder if it doesn't already exist
5) fetches https://raw.githubusercontent.com/jiltq/roblox-client-tweaker/main/ClientAppSettings.json to get the `ClientAppSettings.json` file
6) copies that file into the "ClientSettings" folder

that's it! super unintrusive, super lightweight.

## installation
download `RobloxClientTweaker.bat` and put it on your desktop or something. even better, you can put it in your `shell:startup` folder to have it run on boot!

then, just run it! **do note that you'll have to run it every time roblox updates, but that only happens weekly or so.**

## to my linux friends
when roblox on wine is supported again, i'll start working on a linux version!
