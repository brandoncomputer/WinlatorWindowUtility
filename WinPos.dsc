dialog create,WinPos
title WinPos
dialog show
dialog hide
hotkey add,Ctrl+Alt+M

hotkey add,Ctrl+Alt+X

hotkey add,Ctrl+Alt+S

inifile open,@path(%0)winpos.ini

info "WinPos is active. Ctrl+Alt+S will bring up the Start Menu. Ctrl+Alt+M will gracefully cascade and reposition a window. Ctrl+Alt+X to close. Offset modifiers are located in Winpos.ini"

:evloop
wait event
goto @event()

:hotkey
%%hotkey = @hotkey()

if @equal(%%hotkey,CTRL+ALT+M)
%%winactive = @winactive()
%%hoffset = @iniread(offsets,height)
%%toffset = @iniread(offsets,top)
%%loffset = @iniread(offsets,left)
%%woffset = @iniread(offsets,width) 
window position,%%winactive,%%toffset,%%loffset,@diff(@sysinfo(screenwidth),%%woffset),@diff(@sysinfo(screenheight),%%hoffset)
end

if @equal(%%hotkey,CTRL+ALT+S)
window click,@winexists(#shell_traywnd),20,20
window click,@winexists(#shell_traywnd),20,20
end
if @equal(%%hotkey,CTRL+ALT+X)
Info Click OK to exit.
goto close
end
goto evloop

:close
exit
