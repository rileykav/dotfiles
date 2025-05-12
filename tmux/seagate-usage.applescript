

set theList to {}
set theTotal to ""
set theRemaining to ""
set theString to ""

set theList to paragraphs of text of (do shell script "df -H /Volumes/Seagate\\ 4TB")

-- Works for local drives?
set theTotal to word 3 of theList's item 2
set theRemaining to word 4 of theList's item 2


-- For network drives the numbers are different?
-- set theTotal to word 7 of theList's item 2
-- set theRemaining to word 8 of theList's item 2


set theNameRemainaingOfTotal to "Seagate " & theRemaining & " / " & theTotal

return theNameRemainaingOfTotal