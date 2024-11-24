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
        output += dualoutput
        output += `${title} - ${artist}`.substr(0, 100)
    }
}

output;
