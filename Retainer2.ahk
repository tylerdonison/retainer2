; Version 1.1, added hour buffer to beginning and extra input for tabbing out easier. 
; Version 2.0, added ability to be tabbed out and even minimized.
sleeptime = 1000

#SingleInstance Force
#InstallKeybdHook
SendMode Input
DetectHiddenWindows, On
SetKeyDelay , 50, 30,    ; 50ms is the default delay between presses, 30ms is the press length

if !A_IsAdmin
{
	Run *RunAs "%A_ScriptFullPath%"
	ExitApp
}

Exit

; Start from your list of retainers 
Delete::
	ID := WinExist("A")	

	Sleep 3660000
	SetTimer Retainer, 3660000
	Retainer:
		retainercount = 0 ; will allow looping for later, do not edit
		amountofretainers = 2 ; change according to how many retainers you have
		Loop, %amountofretainers% ; Will loop for each retainer
			{
			ControlSend, , {Numpad0}, ahk_id %ID%
			Sleep 500
			ControlSend, , {Numpad0}, ahk_id %ID% ; Selects retainer 
			Sleep sleeptime
			Sleep sleeptime
			Sleep sleeptime
			ControlSend, , {Numpad0}, ahk_id %ID% ; skips dialog
			Sleep sleeptime
			ControlSend, , {Numpad2}, ahk_id %ID% ; scrolls down to venture 
			Sleep, 500
			ControlSend, , {Numpad2}, ahk_id %ID% ; 2
			Sleep, 500
			ControlSend, , {Numpad2}, ahk_id %ID% ; 3
			Sleep, 500
			ControlSend, , {Numpad2}, ahk_id %ID% ; 4
			Sleep, 500
			ControlSend, , {Numpad2}, ahk_id %ID% ; 5
			Sleep, 500
			ControlSend, , {Numpad0}, ahk_id %ID% ; selects venture 
			Sleep sleeptime
			ControlSend, , {Numpad4}, ahk_id %ID% ; tabs
			Sleep, 500
			ControlSend, , {Numpad0}, ahk_id %ID% ; confirms return
			Sleep, 500
			ControlSend, , {Numpad4}, ahk_id %ID% ; tabs
			Sleep, 500
			ControlSend, , {Numpad0}, ahk_id %ID% ; confirms resend
			Sleep sleeptime
			ControlSend, , {Numpad0}, ahk_id %ID% ; skips dialog
			Sleep sleeptime
			Sleep sleeptime
			Sleep sleeptime
			ControlSend, , {Numpad8}, ahk_id %ID% ; scrolls up to quit
			Sleep sleeptime
			ControlSend, , {Numpad0}, ahk_id %ID% ; selects quit
			Sleep sleeptime
			ControlSend, , {Numpad0}, ahk_id %ID% ; skips dialog
			Sleep sleeptime
			Sleep sleeptime
			Sleep sleeptime
			EnvAdd, retainercount, 1 ; allows added scrolling to get each retainer, tabbing to the second, third, ect
			Loop, %retainercount%
				{
				ControlSend, , {Numpad2}, ahk_id %ID% ; tabs down
				Sleep sleeptime
				}
			Sleep sleeptime
			Sleep sleeptime
			Sleep sleeptime
			}
		ControlSend, , {Numpad2}, ahk_id %ID% ; Scrolls back to top retainer
		Return		
F1::ExitApp
