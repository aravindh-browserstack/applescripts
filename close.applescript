tell application "System Events"
	set availableProcs to (every process where visible is true and name is not equal to "Script Editor")
end tell

repeat with proc in availableProcs
	tell application (name of proc as string)
		quit
	end tell
end repeat

tell application "System Events"
	tell process "Notification Center"
		set theWindows to every window
		repeat with i from 1 to number of items in theWindows
			set this_item to item i of theWindows
			try
				click button 1 of this_item
			on error
				log "Oops ! Failed to close!"
			end try
		end repeat
	end tell
end tell

tell application "Script Editor" to quit
