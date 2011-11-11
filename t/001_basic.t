#!perl -w
use strict;
use Test::More;

use Cocoa::AppleScript;

# test Cocoa::AppleScript here
#warn Cocoa::AppleScript::RunAppleScript(<<SCRIPT);
#	tell application "Keynote"
#	  start
#	end tell
#SCRIPT

warn Cocoa::AppleScript::RunAppleScript(<<SCRIPT);
tell application "iTunes"
	if player state is playing then
		return current track
	end if
end tell
SCRIPT

done_testing;
