package ui;

import flixel.FlxG;
import flixel.FlxSprite;
import haxe.ds.EnumValueMap;

class OptionsState extends MusicBeatState
{
	public var pages:EnumValueMap<PageName, Page> = new EnumValueMap();
	public var currentName:PageName = Options;
	public var currentPage(get, never):Page;

	inline function get_currentPage()
		return pages.get(currentName);

	override function create()
	{
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.color = 0xFFEA71FD;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.scrollFactor.set(0, 0);
		add(bg);
		var optionsmenu:OptionsMenu = addPage(Options, new OptionsMenu(false));
		var preferencesmenu:PreferencesMenu = addPage(Preferences, new PreferencesMenu());
		var controlsmenu:ControlsMenu = addPage(Controls, new ControlsMenu());
		if (optionsmenu.hasMultipleOptions())
		{
			optionsmenu.onExit.add(exitToMainMenu);
			controlsmenu.onExit.add(function()
			{
				switchPage(Options);
			});
			preferencesmenu.onExit.add(function()
			{
				switchPage(Options);
			});
		}
		else
		{
			controlsmenu.onExit.add(exitToMainMenu);
			setPage(Controls);
		}
		currentPage.enabled = false;
                #if mobile addVirtualPad(LEFT_FULL, A_B_C); #end

                #if mobile
		var xd:FlxText = new FlxText(10, 14, 0, 'Press C to customize your android controls', 16);
		xd.setFormat(Paths.font('vcr.ttf'), 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		xd.borderSize = 2.4;
		xd.scrollFactor.set();
		add(xd);
		#end
		super.create();
	}

	function addPage(name:PageName, page:Page):Dynamic
	{
		page.onSwitch.add(switchPage);
		pages.set(name, page);
		add(page);
		page.exists = name == currentName;
		return page;
	}

	function setPage(name:PageName)
	{
		if (pages.exists(currentName))
		{
			currentPage.exists = false;
		}
		currentName = name;
		if (pages.exists(currentName))
		{
			currentPage.exists = true;
		}
	}

	override function finishTransIn()
	{
		super.finishTransIn();
		currentPage.enabled = true;
	}

	function switchPage(name:PageName)
	{
		setPage(name);
	}

	function exitToMainMenu()
	{
		currentPage.enabled = false;
		FlxG.switchState(new MainMenuState());
	}
}
