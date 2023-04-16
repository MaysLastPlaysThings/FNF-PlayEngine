### THESE INSTRUCTIONS ARE FOR COMPILING THE GAME'S SOURCE CODE!!!

IF YOU WANT TO JUST DOWNLOAD AND INSTALL AND PLAY THE GAME NORMALLY, GO TO GAMEBANANA TO DOWNLOAD THE GAME FOR PC AND ANDROID!!!

 gamebanana will be here later

IF YOU WANT TO COMPILE THE GAME YOURSELF, CONTINUE READING!!!

## Build instructions for Windows

### Installing the Required Programs

First, you need to install Haxe and HaxeFlixel. I'm too lazy to write and keep updated with that setup (which is pretty simple). 
1. [Install Haxe 4.2.5](https://haxe.org/download/version/4.2.5/) (Download 4.2.5 instead of 4.3.0 because 4.3.0 is broken and is not working with gits properly...)
2. [Install HaxeFlixel](https://haxeflixel.com/documentation/install-haxeflixel/) after downloading Haxe

Other installations you'd need are the additional libraries, a fully updated list will be in `Project.xml` in the project root. Currently, these are all of the things you need to install:
```
flixel 4.11.0
flixel-addons 2.11.0
flixel-ui
hscript
```
So for each of those type `haxelib install [library]` so shit like `haxelib install openfl`

You'll also need to install a couple things that involve Gits. To do this, you need to do a few things first.
1. Download [git-scm](https://git-scm.com/downloads). Works for Windows, Mac, and Linux, just select your build.
2. Follow instructions to install the application properly.
3. Run `haxelib git polymod https://github.com/larsiusprime/polymod.git` to install Polymod.
4. Run `haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc` to install Discord RPC.

You should have everything ready for compiling the game! Follow the guide below to continue!

### Compiling game
NOTE: If you see any messages relating to deprecated packages, ignore them. They're just warnings that don't affect compiling

Once you have all those installed, it's pretty easy to compile the game. You just need to run `lime test windows -debug` in the root of the project to build and run the windows version.

### Additional guides

- [Command line basics](https://ninjamuffin99.newgrounds.com/news/post/1090480)

### Build instructions for Android
later tho