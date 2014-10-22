use strict;
use warnings;
package Dist::Zilla::Plugin::EOLTests;
# ABSTRACT: Release tests making sure correct line endings are used
$Dist::Zilla::Plugin::EOLTests::VERSION = '0.13';
use Moose;
use namespace::autoclean;

# VERSION

extends 'Dist::Zilla::Plugin::Test::EOL';

#pod =head1 DESCRIPTION
#pod
#pod This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing
#pod the following files:
#pod
#pod =for :list
#pod * xt/release/eol.t
#pod a standard Test::EOL test
#pod
#pod =attr trailing_whitespace
#pod
#pod If this option is set to a true value,
#pod C<< { trailing_whitespace => 1 } >> will be passed to
#pod L<Test::EOL/all_perl_files_ok>. It defaults to C<1>.
#pod
#pod =cut

has '+filename' => (
    default => sub { return 'xt/release/eol.t' },
);

__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::EOLTests - Release tests making sure correct line endings are used

=head1 VERSION

version 0.13

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing
the following files:

=over 4

=item *

xt/release/eol.t

a standard Test::EOL test

=back

=head1 ATTRIBUTES

=head2 trailing_whitespace

If this option is set to a true value,
C<< { trailing_whitespace => 1 } >> will be passed to
L<Test::EOL/all_perl_files_ok>. It defaults to C<1>.

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
