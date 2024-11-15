#!/usr/bin/osascript


set theList to {}
set thePct to ""
set theHr to ""
set theMin to ""
set status to ""
set expression to ""

set theList to paragraphs of text of (do shell script "df -H /Volumes/Seagate\\ 4TB")
set thePct to word 3 of theList's item 2
set theHr to word 5 of theList's item 2


set outOf to "Seagate " & theHr & " / " & thePct

return outOf
