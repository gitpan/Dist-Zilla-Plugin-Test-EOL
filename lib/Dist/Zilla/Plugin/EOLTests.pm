use strict;
use warnings;
package Dist::Zilla::Plugin::EOLTests;
# ABSTRACT: (DEPRECATED) Release tests making sure correct line endings are used
$Dist::Zilla::Plugin::EOLTests::VERSION = '0.15';
use Moose;
extends 'Dist::Zilla::Plugin::Test::EOL';
use namespace::autoclean;

before register_component => sub {
    warnings::warnif('deprecated',
        "!!! [EOLTests] is deprecated and may be removed in a future release; replace it with [Test::EOL] (note the different default filename)\n",
    );
};

has '+filename' => (
    default => sub { return 'xt/release/eol.t' },
);

__PACKAGE__->meta->make_immutable;
1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::EOLTests - (DEPRECATED) Release tests making sure correct line endings are used

=head1 VERSION

version 0.15

=head1 SYNOPSIS

In your F<dist.ini>:

    [EOLTests]

=head1 DESCRIPTION

This is a plugin that runs at the L<gather files|Dist::Zilla::Role::FileGatherer> stage,
providing the file F<xt/release/eol.t>, a standard L<Test::EOL> test.

THIS MODULE IS DEPRECATED. Please use
L<Dist::Zilla::Plugin::Test::EOL> instead. it may be removed at a
later time (but not before April 2015).

In the meantime, it will continue working -- although with a warning.
Refer to the replacement for the full documentation.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
https://rt.cpan.org/Public/Dist/Display.html?Name=Dist-Zilla-Plugin-Test-EO
L or by email to bug-Dist-Zilla-Plugin-Test-EOL@rt.cpan.org.

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 SEE ALSO

Please see those modules/websites for more information related to this module.

=over 4

=item *

L<Dist::Zilla::Plugin::Test::EOL|Dist::Zilla::Plugin::Test::EOL>

=back

=head1 AUTHORS

=over 4

=item *

Florian Ragwitz <rafl@debian.org>

=item *

Caleb Cushing <xenoterracide@gmail.com>

=item *

Karen Etheridge <ether@cpan.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Florian Ragwitz <rafl@debian.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
