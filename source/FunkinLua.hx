package;

#if LUA_ALLOWED

import llua.*;

// NOT STOLEN FROM PSYCH ENGINE!!!!
class FunkinLua extends ScriptGlobals {
    public var lua:State = null;

    public function new(file:String){
        lua = LuaL.newState();
        LuaL.openlibs(file);
        Lua.init_callbacks(lua);

        if (lua != null){
            LuaL.dostring(lua, "
                os.execute, os.getenv, os.rename, os.remove, os.tmpname = nil, nil, nil, nil, nil
                io, load, loadfile, loadstring, dofile = nil, nil, nil, nil, nil
                require, module, package = nil, nil, nil
                setfenv, getfenv = nil, nil
                newproxy = nil
                gcinfo = nil
                debug = nil
                jit = nil
            ");
        }
    }
}

#end