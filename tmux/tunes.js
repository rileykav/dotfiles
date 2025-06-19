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
    // No longer works as of MacOS 15.4
    if (Application("Safari").running()) {
        if ( output=="" ){
            try {
                const app = Application.currentApplication();
                app.includeStandardAdditions = true;
                const mediaDataJson = app.doShellScript("media-control get");
                const attributes = JSON.parse(mediaDataJson);
                const title = attributes["title"];
                const artist = attributes["artist"];
                if (title == "" && artist == ""){
                    // Do Nothing
                } else if (artist == "") {
                    output += dualoutput ? " | " : ""; // Add a separator if needed
                    output += title
                } else {
                    output += dualoutput ? " | " : ""; // Add a separator if needed
                    output += title.substr(0,30) + " - " + artist.substr(0,30)
                }
            } catch (e) {    // Handle errors in executing the shell command
                output += " (Error running Zsh command)";
            }
        } else {
            output+="" // Testing Point
        }
    }

    if (output == ""){
        output+= "Not Playing"
    } else if (output == "null - null"){
        output = "Not Playing"
    } else {
        output = output.substr(0,60)
    }

} catch (error) {
    console.log("Unexpected Error:", error);
    output = "Error Occured";
        }
output;

