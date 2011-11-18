package Cocoa::AppleScript;
use 5.008_001;
use strict;
use warnings;
use parent 'Exporter';

our $VERSION = '0.01';

use XSLoader;

our @EXPORT_OK = qw/RunAppleScript/;
our %EXPORT_TAGS = (all => \@EXPORT_OK);

XSLoader::load(__PACKAGE__, $VERSION);

sub RunAppleScript {
    my $str = shift;

    xs_RunAppleScript($str);
}

1;
__END__

=head1 NAME

Cocoa::AppleScript - Perl extention to do something

=head1 VERSION

This document describes Cocoa::AppleScript version 0.01.

=head1 SYNOPSIS

    use Cocoa::AppleScript;

=head1 DESCRIPTION

# TODO

=head1 INTERFACE

=head2 Functions

=head3 C<< hello() >>

# TODO

=head1 DEPENDENCIES

Perl 5.8.1 or later.

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 SEE ALSO

L<perl>

=head1 AUTHOR

<<YOUR NAME HERE>> E<lt><<YOUR EMAIL ADDRESS HERE>>E<gt>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2011, <<YOUR NAME HERE>>. All rights reserved.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
