#!perl -w
use strict;
use Test::More;
use Test::Exception;

use Cocoa::AppleScript;

# test Cocoa::AppleScript here

lives_ok {
    Cocoa::AppleScript::RunAppleScript(<<SCRIPT);
tell application "Finder"
  activate
end tell
SCRIPT
} "do applescript";

dies_ok {
  Cocoa::AppleScript::RunAppleScript(<<SCRIPT);
tell application "Finder"
  activate
end tells
SCRIPT
} "syntax error";

done_testing;
