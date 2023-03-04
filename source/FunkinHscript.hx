package;

#if HSCRIPT_ALLOWED
import hscript.Parser;
import hscript.Interp;
#end
import flixel.util.FlxDestroyUtil.IFlxDestroyable;

class FunkinHscript extends ScriptGlobals implements IFlxDestroyable {
    #if HSCRIPT_ALLOWED
    var interp:Interp;

    public function new() {
        interp = new Interp();
    }

    function runScript(file:String){
        var parser = new Parser();

        parser.allowMetadata = parser.allowJSON = parser.allowTypes = true;

        try {
            final parsedFile = parser.parseString(file);

            interp.execute(parsedFile);
        }
        catch (e){
            openfl.Lib.application.window.alert(e.message, "Hscript error");
        }
    }

    function getFunction(func:String, ?args:Array<Dynamic>){
        if (interp == null) return;

        if (interp.variables.exists(func)){
            var daFunc = interp.variables.get(func);
            var result = null;
            try {
                result = (args == null) ? func() : Reflect.callMethod(null, func, args);
            }
            catch (e){
                trace('$e');
            }
            return result;
        }
        return null;
    }

    public function setVariable(name:String, value:Dynamic){
        interp.variables.set(name, value);
    }

    public function getVariable(name:String){
        return interp.variables.get(name);
    }

    public function destroy(){
        parser = null;
        interp = null;
    }
    #end
}