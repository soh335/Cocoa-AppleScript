#!perl -w
use strict;
use constant HAS_THREADS => eval { require threads };
use if !HAS_THREADS, 'Test::More',
    skip_all => 'multi-threading tests';

use Test::More;

use Cocoa::AppleScript;

my @threads;

for (1 .. 3) {
    push @threads, threads->create(sub {
        # use Cocoa::AppleScript here
        pass;
    });
}
$_->join for @threads;

done_testing;
