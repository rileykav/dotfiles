#!/usr/bin/osascript


set theList to {}
set thePct to ""
set theHr to ""
set theMin to ""
set status to ""
set expression to ""

set theList to paragraphs of text of (do shell script "pmset -g batt")
set thePct to word 6 of theList's item 2

return thePct
