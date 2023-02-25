package display;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import openfl.Lib;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import flixel.FlxG;
import haxe.Timer;
import openfl.events.Event;
import openfl.text.TextField;
import openfl.text.TextFormat;
#if gl_stats
import openfl.display._internal.stats.Context3DStats;
import openfl.display._internal.stats.DrawCallContext;
#end
#if flash
import openfl.Lib;
#end
#if openfl
import openfl.system.System;
#end
/**The FPS class provides an easy-to-use monitor to display the current frame rate of an OpenFL project**/
#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
class FPS extends TextField
{
  public var currentFPS(default, null):Int;

  public var bitmap:Bitmap;

  public var memoryMegas:Float;

	public var memoryTotal:Float;

	@:noCompletion private var cacheCount:Int;

	@:noCompletion private var currentTime:Float;

  @:noCompletion private var times:Array<Float>;

	public function new(x:Float = 15, y:Float = 15, color:Int = 0x000000)
		{
		super();

		this.x = x;
		this.y = y;