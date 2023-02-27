package;

#if HSCRIPT_ALLOWED
import hscript.Parser;
import hscript.Interp;
#end
import flixel.util.FlxDestroyUtil.IFlxDestroyable;

class FunkinHscript implements IFlxDestroyable {
    var parser:Parser;
    var interp:Interp;

    public function new(file:String) {
        parser = new Parser();
        interp = new Interp();
        try {
            if (parser != null){
                final parsedFile = parser.parseString(file);
                if (interp != null)
                    interp.execute(parsedFile);
            }
        }
        catch (e){
            lime.app.Application.current.window.alert(e.message, 'HScript Error');
        }
    }

    public function destroy(){
        parser = null;
        interp = null;
    }
}