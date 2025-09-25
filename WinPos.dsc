dialog create,WinPos
title WinPos
hotkey add,Ctrl+Alt+M
hotkey add,Ctrl+Alt+X

info "WinPos is active. Ctrl+Alt+M will bring up the Start Menu. When a window is maximized, it will be gracefully cascaded and repositioned. Ctrl+Alt+X to close."

:evloop
wait 1
%%event = @event()
if %%event
goto %%event
end

%%winactive = @winactive()
if @null(%%winactive)
goto evloop
end
if @equal(@winpos(%%winactive,s),3)
window normal,%%winactive
window position,%%winactive,0,0,@sysinfo(screenwidth),@diff(@sysinfo(screenheight),20)
end
goto evloop


:hotkey
%%hotkey = @hotkey()
if @equal(%%hotkey,CTRL+ALT+M)
window click,@winexists(#shell_traywnd),20,20
window click,@winexists(#shell_traywnd),20,20
end
if @equal(%%hotkey,CTRL+ALT+X)
goto close
end
goto evloop

:close
exit
