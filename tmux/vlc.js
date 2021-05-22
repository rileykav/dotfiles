
let output = "";
if (Application("VLC").running()) {
    if (Application("VLC").playing()) {
        const track = Application("VLC").nameOfCurrentItem();
        const duration = Application("VLC").durationOfCurrentItem()//60;
        //const title = track.name();
        //output=track
        //output = `${track} - ${duration}`.substr(0, 100)
        output = `${track}`.substr(0, 100);
    }
}

output;
