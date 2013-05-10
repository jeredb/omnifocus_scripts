-- 	prune_old_omnifocus
--	Created by: Sean Korzdorfer
--	Created on: 05/10/13 13:14:39
--	Modified by: Jered Benoit
--	Modified on: 20130510 1636
--
--
-- 	To get project id: Right click the project -> Copy as Link. You'll get:
-- 		omnifocus:///task/foo
-- 	foo is project id
--
-- 	CAUTION: This script deletes tasks. Be careful

tell application "OmniFocus"
	-- Set the number of days old a task can be before deletion.
	display dialog "Number of days old a task can be for deletion?" default answer "14" buttons {"Cancel", "OK"} default button 2
	set daysPrevious to (the text returned of the result) as string
	-- Last Chance
	display alert "This deletes tasks!" buttons {"Whoa Nelly!", "Scorched Earth"} default button 2
	set LineInSand to (the button returned of the result) as string
	if (LineInSand is equal to "Whoa Nelly!") then
		error number -128
	else
		set killDate to (current date) - (daysPrevious * days)
	tell front window
			try
				set theTrees to selected trees of content
				if (count of theTrees) < 1 then
					set theTrees to selected trees of sidebar
				end if
			
				if (count of theTrees) < 1 then
					return
				end if
					
				set theSelection to value of item 1 of theTrees
				set theTasks to every flattened task of theSelection
			
				repeat with theTask in theTasks
					if creation date of theTask is less than killDate then delete theTask
				end repeat
			end try
		end tell
	end if
end tell

