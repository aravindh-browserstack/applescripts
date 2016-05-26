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
		activate
		delay 1
		set windowid to 1
		if (appname as string) is equal to "Opera" then
			set windowid to 2
		end if
		tell window (windowid as integer)
			perform action "AXZoomWindow" of (first button whose subrole is "AXFullScreenButton")
		end tell
	end tell
end tell

