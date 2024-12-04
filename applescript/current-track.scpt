#!/usr/bin/osascript



if application "VLC" is running then
	tell application "VLC"
		set theName to name of current item
        try
            return theName
        on error err
        end try
	end tell

else if application "Spotify" is running then
    tell application "Spotify"
        set theName to name of the current track
        set theArtist to artist of the current track
        set theAlbum to album of the current track
        set theUrl to spotify url of the current track
        try
            return "♫ " & theName & " - " & theArtist
        on error err
        end try
    end tell
else
    do shell script "echo Spotify not running."
end if

