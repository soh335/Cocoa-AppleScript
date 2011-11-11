#!perl -w
use strict;
use Test::Requires { 'Test::LeakTrace' => 0.13 };
use Test::More;

use Cocoa::AppleScript;

no_leaks_ok {
    # use Cocoa::AppleScript here
};

done_testing;
