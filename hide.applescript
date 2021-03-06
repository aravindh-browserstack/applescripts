tell application "System Events"
	set listProcs to {"Google Chrome", "firefox", "Safari", "Opera"}
	set browserProcs to {}
	set availableProcs to (name of every process where background only is false)
	repeat with procname in listProcs
		if availableProcs contains procname then
			set end of browserProcs to procname
		end if
	end repeat
	tell me to set selectedProcess to choose from list browserProcs
	set appname to {first item of selectedProcess}
	tell process (appname as string)
		set frontmost to true
		delay 1
		keystroke "h" using {command down}
	end tell
end tell

