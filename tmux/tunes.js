let output = "";
if (Application("Spotify").running()) {
    if (Application("Spotify").playerState() == "playing") {
        const track = Application("Spotify").currentTrack;
        const artist = track.artist();
        const title = track.name();
        output = `${title} - ${artist}`.substr(0, 100)
    }
}

output;
