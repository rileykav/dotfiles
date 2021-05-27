
let output = "";
if (Application("VLC").running()) {
    if (Application("VLC").playing()) {
        const track = Application("VLC").nameOfCurrentItem();
        const duration = Application("VLC").durationOfCurrentItem()//60;
        output = `${track}`.substr(0, 50);
    }
}

output;
