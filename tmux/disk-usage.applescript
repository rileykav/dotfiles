#!/usr/bin/osascript


set theList to {}
set theTotal to ""
set theRemaining to ""

set theList to paragraphs of text of (do shell script "df -H /")
set theTotal to word 3 of theList's item 2
set theRemaining to word 5 of theList's item 2


set outOf to "Macbook " & theRemaining & " / " & theTotal

return outOf
