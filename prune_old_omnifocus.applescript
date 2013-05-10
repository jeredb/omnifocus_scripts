-- 	prune_old_omnifocus
--	Created by: Sean Korzdorfer
--	Created on: 05/10/13 13:14:39
--
--
-- 	To get project id: Right click the project -> Copy as Link. You'll get:
-- 		omnifocus:///task/foo
-- 	foo is project id
--
-- 	CAUTION: This script deletes tasks. Be careful

tell application "OmniFocus"
	-- Set project id
	set projectID to ""
	-- Set the number of days old a task can be before deletion.
	set daysPrevious to 14
	set killDate to (current date) - (daysPrevious * days)
	tell front document
		set theTasks to every task of project id projectID
	end tell
	repeat with theTask in theTasks
		if creation date of theTask is less than killDate then delete theTask
	end repeat
end tell

