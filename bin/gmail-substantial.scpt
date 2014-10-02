tell application "Google Chrome"
	set window_list to every window
	repeat with the_window in window_list
		set tab_list to every tab in the_window
		set i to 0
		repeat with the_tab in tab_list
			set i to i + 1
			set the_title to the title of the_tab
			if the_title contains "- aaron@substantial.com - Substantial" then
				set index of the_window to 1
				set active tab index of first window to i
				delay 0.05
				do shell script "open -a Google\\ Chrome"
				return
			end if
		end repeat
	end repeat
	make new window
	set URL of active tab of window 1 to "https://mail.google.com/mail/u/1"
	delay 0.05
	do shell script "open -a Google\\ Chrome"
end tell
