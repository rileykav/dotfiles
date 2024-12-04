

set theList to {}
set theTotal to ""
set theRemaining to ""
set theString to ""

set theList to paragraphs of text of (do shell script "df -H /Volumes/Seagate\\ 4TB")
set theTotal to word 7 of theList's item 2
set theRemaining to word 8 of theList's item 2


set theString to "Seagate " & theRemaining & " / " & theTotal

return theString