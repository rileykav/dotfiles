#!/usr/bin/osascript


tell application "Music"
	if player state is playing then
		set trackName to name of current track
		set trackArtist to artist of current track
		return trackName & " - " & trackArtist
	else
		return ""
	end if
end tell