let output = "";
let dualoutput = "";
try {
//     if (Application("Spotify").running()) {
//         if (Application("Spotify").playerState() == "playing") {
//             const track = Application("Spotify").currentTrack;
//             const artist = track.artist();
//             const title = track.name();
//             output += title + " - " + artist
//             dualoutput = " & "
//         }
//     }

    if (Application("Music").running()) {
        if (Application("Music").playerState() == "playing") {
            const track = Application("Music").currentTrack;
            const artist = track.artist();
            const title = track.name();
            output += dualoutput ? " | " : ""; // Add a separator if needed
            output += title + " - " + artist
        }
    }
//     if ( (Application("Safari").running()) || (Application("Plexamp").running())) {
    if (Application("Safari").running()) {
        if ( output=="" ){
            try {
                const app = Application.currentApplication();
                app.includeStandardAdditions = true;
                const title = app.doShellScript("nowplaying-cli get title");
                const artist = app.doShellScript("nowplaying-cli get artist");
                if (title == "" && artist == ""){
                    // Do Nothing
                } else if (artist == ""){
                    output += dualoutput ? " | " : ""; // Add a separator if needed
                    output += title
                } else {
                    output += dualoutput ? " | " : ""; // Add a separator if needed
                    output += title + " - " + artist
                }

            } catch (e) {
                // Handle errors in executing the shell command
                output += " (Error running Zsh command)";
            }
        } else {
            output+="AAAA"
        }
    }

    if (output == ""){
        output+= "Not Playing"
    } else {
        output = output.substr(0,30)
    }

} catch (error) {
    console.log("Unexpected Error:", error);
    output = "Error Occured";
        }
output;

