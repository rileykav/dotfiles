let output = "";
let dualoutput = "";
if (Application("Spotify").running()) {
    if (Application("Spotify").playerState() == "playing") {
        const track = Application("Spotify").currentTrack;
        const artist = track.artist();
        const title = track.name();
        output += `${title} - ${artist}`.substr(0, 100)
        dualoutput = " & "
    }
}

if (Application("Music").running()) {
    if (Application("Music").playerState() == "playing") {
        const track = Application("Music").currentTrack;
        const artist = track.artist();
        const title = track.name();
        output += dualoutput ? " | " : ""; // Add a separator if needed
        output += `${title} - ${artist}`.substr(0, 100)
    }
}
if ( (Application("Safari").running()) || (Application("Plexamp").running())) {
    if ( output=="" ){
        try {
            const app = Application.currentApplication();
            app.includeStandardAdditions = true;
            const title = app.doShellScript("nowplaying-cli get title");
            const artist = app.doShellScript("nowplaying-cli get artist");
            if (title != "" || artist != ""){
                output += dualoutput ? " | " : ""; // Add a separator if needed
                output += `${title} - ${artist}`.substr(0, 100)
            }
        } catch (e) {
            // Handle errors in executing the shell command
            output += " (Error running Zsh command)";
        }
    }
}

if (output == ""){
    output+= "Not Playing"
}

output;
