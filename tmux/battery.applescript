#!/usr/bin/osascript


set theList to {}
set thePct to ""
set status to ""

set theList to paragraphs of text of (do shell script "pmset -g batt")
set thePct to word 6 of theList's item 2 as integer
set status to word 7 of theList's item 2
if thePct is greater than 20 then
    if status is in {"charging"} then
        return "↯" & thePct
    else if status is in {"charged"}
        return "↯" & thePct
    end if
else if thePct less than 20 then
    if not status is "charging" then
        return "WARNING!! BATERY LOW > NOT CHARGING - " & thePct 
    end if
end if
return thePct
