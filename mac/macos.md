# Macos


## Installing Steps



## Other Instructions

### icns Files
To create an icns file, requires several differnent png files that are joined together to make the iconset, formated like:
- icon_16x16.png
- icon_32x32.png
- icon_128x128.png
- icon_256x256.png
- icon_512x512.png
- icon_1024x1024.png
in a .iconset folder. If you only have one, ie the 1024x1024, you can use `convert icon.png -resize 512x512 icon_512x512.png` to generate lower resolution images.
Once your images are all inside the iconset folder: use `iconutil -c icns FolderName.iconset` to convert this to a .icns file. This can be then applied to a .app in the Contents > Resources > shortcut.icns file
