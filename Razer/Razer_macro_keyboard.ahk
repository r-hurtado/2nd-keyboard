#NoEnv
SendMode Input
#InstallKeybdHook
;#InstallMouseHook
#UseHook On

;;EXACT LOCATION FOR WHERE TO PUT THIS SCRIPT:
; C:\AHK\2nd-keyboard\Razer\
;;(This is "MANDATORY")

;;Location for where to put a shortcut to this script, so that it will start with Windows:
;;  Here for just yourself:
;;  C:\Users\YOUR_USERNAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
;;  Or here for all users:
;;  C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp

#SingleInstance force ;only one instance may run at a time!
#MaxHotkeysPerInterval 2000
#WinActivateForce ;https://autohotkey.com/docs/commands/_WinActivateForce.htm ;this may prevent taskbar flashing.
detecthiddenwindows, on
Menu, Tray, Icon, shell32.dll, 13 ;turns the tray icon into a computer chip. If you don't like it, choose another: https://github.com/TaranVH/2nd-keyboard/blob/master/INFO_and_PROFILES/system32-shell32_dll.png
;;#NoTrayIcon ;If you don't want a tray icon, comment this in. Not recommended! You won't know if it's running or not.

;________________________________________________________________________________________
;                                                                                        
;     2ND KEYBOARD USING Razer Synapse (and the Blackwidow Chroma, specifically)
;________________________________________________________________________________________
;                                                                                         
;     Please watch https://youtu.be/GttedCcyxa4 for a comprehensive tutorial.
;________________________________________________________________________________________

;; You should DEFINITELY not be trying to add a 2nd keyboard unless you're already
;; familiar with how AutoHotkey works. I recommend that you at least take this tutorial:
;; https://autohotkey.com/docs/Tutorial.htm

;; You should probably use something better than Notepad for your scripting. I use Visual Studio Code. 

;;----------------------------------------------------------------------------
;;;;;;Receive_WM_COPYDATA RECEIVES MESSAGES AND TURNS THEM INTO FUNCTIONS:;;;;
;;----------------------------------------------------------------------------
;;Discussion:https://autohotkey.com/board/topic/18361-anyway-to-pass-params-to-script-while-running/
;;Where I got the script from:
; https://autohotkey.com/docs/commands/OnMessage.htm

#ifwinactive
OnMessage(0x4a, "Receive_WM_COPYDATA")  ; 0x4a is WM_COPYDATA
return

Receive_WM_COPYDATA(wParam, lParam)
{
    StringAddress := NumGet(lParam + 2*A_PtrSize)  ; Retrieves the CopyDataStruct's lpData member.
    CopyOfData := StrGet(StringAddress)  ; Copy the string out of the structure.
    ;msgbox, %A_ScriptName%`nReceived the following string:`n`n%CopyOfData%

    Var = %CopyOfData%
    StringTrimRight, Var, Var, 4  ;Removes .ahk from the string
    ;;OutputVar := SubStr(String, 1, InStr(string, ".") - 1) ;<-- This grabs whatever text is to the left of a period. This is just an alternative way of removing ".ahk" ...Whatever.

    ;AHK does not have a SWITCH case. So this is what we do instead:
    ; https://jacksautohotkeyblog.wordpress.com/2018/11/02/use-the-ternary-operator-to-create-conditional-case-statements-or-switches-autohotkey-tip/#more-40047
    DoSomething := Var = "ESC" ? function("Escape!")
        : Var = "F1" ?          volMt()
        : Var = "F2" ?          volDn()
        : Var = "F3" ?          volUp()
        : Var = "F4" ?          function("F4")
        : Var = "F5" ?          function("F5")
        : Var = "F6" ?          function("F6")
        : Var = "F7" ?          function("F7")
        : Var = "F8" ?          function("F8")
        : Var = "F9" ?          function("F9")
        : Var = "F10" ?         function("F10")
        : Var = "F11" ?         function("F11")
        : Var = "F12" ?         function("F12")
        : Var = "tilde" ?       function("tilde or whatever")
        : Var = "1" ?           function("1")
        : Var = "2" ?           function("2")
        : Var = "3" ?           function("3")
        : Var = "4" ?           function("4")
        : Var = "5" ?           function("5")
        : Var = "6" ?           function("6")
        : Var = "7" ?           function("7")
        : Var = "8" ?           function("8")
        : Var = "9" ?           function("9")
        : Var = "0" ?           function("0")
        : Var = "minus" ?       function("_-")
        : Var = "plus" ?        function("+=")
        : Var = "backspace" ?   function("backspaaaaace")
        : Var = "tab" ?         function("tab")
        : Var = "q" ?           function("q")
        : Var = "w" ?           function("w")
        : Var = "e" ?           function("e")
        : Var = "r" ?           function("r")
        : Var = "t" ?           function("t")
        : Var = "y" ?           function("y")
        : Var = "u" ?           function("u")
        : Var = "i" ?           function("i")
        : Var = "o" ?           function("o")
        : Var = "p" ?           function("p")
        : Var = "leftbracket" ? function("[")
        : Var = "rightbracket" ?function("]")
        : Var = "backslash" ?   function("backslash")
        : Var = "capslock" ?    function("caps")
        : Var = "a" ?           function("aaaay")
        : Var = "s" ?           function("s")
        : Var = "d" ?           function("d")
        : Var = "f" ?           function("f")
        : Var = "g" ?           function("g")
        : Var = "h" ?           function("h")
        : Var = "j" ?           function("j")

    ;;Our expression gets too long if we continue.
    ;; https://autohotkey.com/board/topic/70201-ahk-110200-u32-error-expression-too-long/
    ;;So I had to divide this into two blocks. Lol.
    DoSomethingElse := Var = "k" ? function("k")
        : Var = "l" ?           function("l")
        : Var = "semicolon" ?   function(";")
        : Var = "singlequote" ? function("'")
        : Var = "enter" ?       function("enter")
        : Var = "LShift" ?      function("Left Shift")
        : Var = "z" ?           function("z")
        : Var = "x" ?           function("x")
        : Var = "c" ?           function("c")
        : Var = "v" ?           function("v")
        : Var = "b" ?           function("b")
        : Var = "n" ?           function("n")
        : Var = "m" ?           function("m")
        : Var = "comma" ?       function(",")
        : Var = "period" ?      function(".")
        : Var = "forwardslash" ?function("/")
        : Var = "RShift" ?      function("RShift")
        : Var = "RCtrl" ?       function("Rctrl")
        : Var = "RWin" ?        function("Rwin") ;this key does not exist on a razer keyboard
        : Var = "RAlt" ?        function("Ralt")
        : Var = "space" ?       function("le space")
        : Var = "Lalt" ?        function("LAlt")
        : Var = "LWin" ?        function("LWin") ;This key can't be remapped in Razer Synapse
        : Var = "appskey" ?     function("appskey can be annoying")
        : Var = "LCtrl" ?       function("LCtrl")
        : Var = "BSP" ?         function("Backspace")
        : Var = "printscreen" ? function("PrtScn")
        : Var = "scrollLock" ?  function("more like LOL lock")
        : Var = "pauseBreak" ?  function("the worst key")
        : Var = "insert" ?      function("insert")
        : Var = "delete" ?      function("delete")
        : Var = "home" ?        function("home")
        : Var = "end" ?         function("end")
        : Var = "pageup" ?      function("pgup")
        : Var = "pagedown" ?    function("pgdn")
        : Var = "up" ?          ParentDir()
        : Var = "down" ?        function("down")
        : Var = "left" ?        function("port")
        : Var = "right" ?       function("starboard")
        : Var = "NumLock" ?     function("Numlock is awful")
        : Var = "numpadDiv" ?   function("numpadDiv")
        : Var = "numpadMult" ?  function("numpadMult")
        : Var = "numpadMinus" ? muteMicDiscord()
        : Var = "numpadAdd" ?   function("numpad+")
        : Var = "numpadEnter" ? function("numpadEnter")
        : Var = "numpadDot" ?   function("numpad dot or delete or whatever")
        : Var = "numpad0" ?     function("numpad0")
        : Var = "numpad1" ?     function("numpad1")
        : Var = "numpad2" ?     function("numpad2")
        : Var = "numpad3" ?     function("numpad3")
        : Var = "numpad4" ?     function("numpad4")
        : Var = "numpad5" ?     function("numpad5")
        : Var = "numpad6" ?     function("numpad6")
        : Var = "numpad7" ?     function("numpad7")
        : Var = "numpad8" ?     function("numpad8")
        : Var = "numpad9" ?     whateverrr("this happens when you press numpad9","and this too")
        ;;: Else nope(Var) ;This won't work properly now that it's split in half.
        
    DoSomethingDiff := Var = "EQUALS" ? function("=")
        : Var = "macro1" ?      MapList()
        : Var = "macro2" ?      function("macro2")
        : Var = "macro3" ?      function("macro3")
        : Var = "macro4" ?      InstantExplorer("C:\AHK\2nd-keyboard\Razer")
        : Var = "macro5" ?      ReloadMe()

    ;Now we are at the end.
    return true  ; Returning 1 (true) is the traditional way to acknowledge this message.
}

;;#############################################################################
;;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;;~~~~~~~~~~~~~~~~~DEFINE YOUR FUNCTIONS BELOW THIS LINE~~~~~~~~~~~~~~~~~~~~~~~
;;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;;#############################################################################

function(par)
{
    msgbox, Hooray, you pressed`n%par%`n on your Razer keyboard!
}

whateverrr(stuff, things)
{
    msgbox, %stuff%`nand`n%things%
}

; Reloads this script, it beeps
ReloadMe()
{
    Reload
    Sleep 1000 ; If the reload is successful, the sleep command will never finish, hence the error handling code below will never be reached.
    MsgBox, 4,, The script could not be reloaded.
    Return
}

; Toggles whether the master volume is muted
volMt()
{
    SoundSet, +1, , mute
}

; Turns the master volume down 2%
volDn()
{
    SoundSet, -2
}

; Turns the master volume up 2%
volUp()
{
    SoundSet, +2
}

; Sends Alt+Up, which changes current directory to its parent
ParentDir()
{
    Send, !{Up}
}

; Send Win+Alt+Ctrl+Shift+- (Minus key) to Discord, toggling whether my mic is muted
muteMicDiscord()
{
    send, #!^+-
}

; Taran's Instant Explorer function
; Found on line 399 of https://github.com/TaranVH/2nd-keyboard/blob/master/Almost_All_Windows_Functions.ahk
InstantExplorer(f_path,pleasePrepend := 0)
{
    ;this has been heavily modified from https://autohotkey.com/docs/scripts/FavoriteFolders.htm

    send {SC0E8} ;scan code of an unassigned key. This is needed to prevent the item from merely FLASHING on the task bar, rather than opening the folder. Don't ask me why, but this works.

    if pleasePrepend = 1 ;i forget what this is even for...
        {
        FileRead, SavedExplorerAddress, C:\AHK\2nd-keyboard\Taran's_Windows_Mods\SavedExplorerAddress.txt
        ;msgbox, current f_path is %f_path%
        f_path = %SavedExplorerAddress%\%f_path% ;there is no need to use . to concatenate
        ;msgbox, new f_path is %f_path%
        }
    ;NOTE TO FUTURE TARAN: for Keyshower, put code here to find the first / and remove the string before it. otherwise you can't see the final folder name
    ;Keyshower(f_path,"InstExplor")
    if IsFunc("Keyshower") {
        Func := Func("Keyshower")
        RetVal := Func.Call(f_path,"InstExplor") 
    }

    ;;;SUPER IMPORTANT: YOU NEED TO GO INTO FOLDER OPTIONS > VIEW > AND CHECK "DISPLAY THE FULL PATH IN THE TITLE BAR" OR THIS WON'T WORK.

    if !FileExist(f_path)
    {
        MsgBox,,, %f_path%`nNo such path exists.,1.7
        GOTO, instantExplorerEnd
    }

    f_path := """" . f_path . """" ;this adds quotation marks around everything so that it works as a string, not a variable.

    ; These first few variables are set here and used by f_OpenFavorite:
    WinGet, f_window_id, ID, A
    WinGetClass, f_class, ahk_id %f_window_id%
    WinGetTitle, f_title, ahk_id %f_window_id% ;to be used later to see if this is the export dialogue window in Premiere...
    if f_class in #32770,ExploreWClass,CabinetWClass  ; if the window class is a save/load dialog, or an Explorer window of either kind.
        ControlGetPos, f_Edit1Pos, f_Edit1PosY,,, Edit1, ahk_id %f_window_id%

    ; Fetch the array element that corresponds to the selected menu item:
    ;;StringTrimLeft, f_path, f_path%A_ThisMenuItemPos%, 0
    if f_path =
        return
    if f_class = #32770    ; It's a dialog.
    {
        if f_title = Export Settings
        {
            msgbox,,,you are in Premiere's export window, but NOT in the "Save as" inside of THAT window. no bueno, 1
            GOTO, instantExplorerEnd 
            ;return ;no, I don't want to return because i still want to open an explorer window.
        }
        if WinActive("ahk_exe Adobe Premiere Pro.exe")
        {
            tooltip,you are inside of premieres save as thingy
            if f_title = Save As or f_title = Save Project ;IDK if this OR is properly nested....
            {
                ControlFocus, Edit1, ahk_id %f_window_id% ;this is really important.... it doesn't work if you don't do this...
                msgbox,,,you are here,0.5
                tippy2("DIALOGUE WITH PREMIERE'S Edit1`n`nLE controlfocus of Edit1 for f_window_id was just engaged.", 2000)
                ; msgbox, is it in focus?
                ; MouseMove, f_Edit1Pos, f_Edit1PosY, 0
                ; sleep 10
                ; click
                ; sleep 10
                ; msgbox, how about now? x%f_Edit1Pos% y%f_Edit1PosY%
                ;msgbox, Edit1 has been clicked maybe
                
                ; Activate the window so that if the user is middle-clicking
                ; outside the dialog, subsequent clicks will also work:
                WinActivate ahk_id %f_window_id%
                ; Retrieve any filename that might already be in the field so
                ; that it can be restored after the switch to the new folder:
                ControlGetText, f_text, Edit1, ahk_id %f_window_id%
                
                ControlSetText, Edit1, %f_path%, ahk_id %f_window_id%
                ControlSend, Edit1, {Enter}, ahk_id %f_window_id%
                Sleep, 100  ; It needs extra time on some dialogs or in some cases.
                ControlSetText, Edit1, %f_text%, ahk_id %f_window_id%
                ;msgbox, AFTER:`n f_path: %f_path%`n f_class:  %f_class%`n f_Edit1Pos:  %f_Edit1Pos%
                
                tooltip,
                return
            }
        }
        
        if f_Edit1Pos <>   ; And it has an Edit1 control.
        {

            ControlFocus, Edit1, ahk_id %f_window_id% ;this is really important.... it doesn't work if you don't do this...
            tippy2("DIALOGUE WITH EDIT1`n`nwait really?`n`nLE controlfocus of edit1 for f_window_id was just engaged.", 1000)
            
            ; Activate the window so that if the user is middle-clicking
            ; outside the dialog, subsequent clicks will also work:
            WinActivate ahk_id %f_window_id%
            
            ; Retrieve any filename that might already be in the field so
            ; that it can be restored after the switch to the new folder:
            ControlGetText, f_text, Edit1, ahk_id %f_window_id%
            
            ControlSetText, Edit1, %f_path%, ahk_id %f_window_id%
            ControlSend, Edit1, {Enter}, ahk_id %f_window_id%
            Sleep, 100  ; It needs extra time on some dialogs or in some cases.
            
            ;now RESTORE the filename in that text field. I don't like doing it this way...
            ControlSetText, Edit1, %f_text%, ahk_id %f_window_id%
            ;msgbox, AFTER:`n f_path: %f_path%`n f_class:  %f_class%`n f_Edit1Pos:  %f_Edit1Pos%
            
            ControlFocus, DirectUIHWND2, ahk_id %f_window_id% ;to try to get the focus back into the center area, so you can now type letters and have it go to a file or folder, rather than try to SEARCH or try to change the FILE NAME by default.
            return
        }
        ; else fall through to the bottom of the subroutine to take standard action.
    }
    else if f_class = ConsoleWindowClass ; In a console window, CD to that directory
    {
        WinActivate, ahk_id %f_window_id% ; Because sometimes the mclick deactivates it.
        SetKeyDelay, 0  ; This will be in effect only for the duration of this thread.
        IfInString, f_path, :  ; It contains a drive letter
        {
            StringLeft, f_path_drive, f_path, 1
            Send %f_path_drive%:{enter}
        }
        Send, cd %f_path%{Enter}
        return
    }

    ending2:
    ; Since the above didn't return, one of the following is true:
    ; 1) It's an unsupported window type but f_AlwaysShowMenu is y (yes).
    ; 2) It's a supported type but it lacks an Edit1 control to facilitate the custom
    ;    action, so instead do the default action below.
    Tippy2("end was reached.",333)
    Run, %f_path%  ; I got rid of the "Explorer" part because it caused redundant windows to be opened, rather than just switching to the existing window
    
    instantExplorerEnd:
}

; Required for Tippy2
notip2:
	ToolTip,,,,8
	;removes the tooltip
return

; Function required for InstantExplorer
Tippy2(tipsHere, wait:=333)
{
    ToolTip, %tipsHere%,,,8
    SetTimer, notip2, %wait% ;--in 1/3 seconds by default, remove the tooltip
}

; Lists the keys that are mapped and the functions they are mapped to
MapList()
{
    ; Works for now, Looking into making a GUI to help with spacing
    FileRead, ListStr, C:\AHK\2nd-keyboard\Razer\MapList.txt
    msgbox, Key      Function`n`n%ListStr%
}