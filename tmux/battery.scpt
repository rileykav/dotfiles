#!/usr/bin/osascript


set theList to {}
set thePct to ""
set theHr to ""
set theMin to ""
set status to ""
set expression to ""

set theList to paragraphs of text of (do shell script "pmset -g batt")
set thePct to word 6 of theList's item 2 as integer
set status to word 7 of theList's item 2
if thePct is greater than 101 then
    if status is in {"charging", "charged"} then
        return "↯" & thePct
    else 
        return thePct 
    end if
else if thePct less than 20 then
    if not status is "charging" then
        return "WARNING!! BATERY LOW > NOT CHARGING - " & thePct 
    end if
end if
return thePct
