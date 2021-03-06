use strict;
use warnings;
package Dist::Zilla::Plugin::Test::EOL;
# git description: 0.15-1-ga8c428a
$Dist::Zilla::Plugin::Test::EOL::VERSION = '0.16';

use Moose;
use Sub::Exporter::ForMethods 'method_installer';
use Data::Section 0.004 # fixed header_re
    { installer => method_installer }, '-setup';
use namespace::autoclean;

with
    'Dist::Zilla::Role::FileGatherer',
    'Dist::Zilla::Role::TextTemplate',
    'Dist::Zilla::Role::PrereqSource',
;

has trailing_whitespace => (
    is      => 'ro',
    isa     => 'Bool',
    default => 1,
);

has filename => (
    is => 'ro', isa => 'Str',
    lazy => 1,
    default => sub { return 'xt/author/eol.t' },
);

around dump_config => sub
{
    my ($orig, $self) = @_;
    my $config = $self->$orig;

    $config->{+__PACKAGE__} = {
         filename => $self->filename,
    };
    return $config;
};

sub gather_files
{
    my $self = shift;

    require Dist::Zilla::File::InMemory;

    $self->add_file(
        Dist::Zilla::File::InMemory->new(
            name => $self->filename,
            content => $self->fill_in_string(
                ${$self->section_data('__TEST__')},
                {
                    name    => __PACKAGE__,
                    version => __PACKAGE__->VERSION
                               || 'bootstrapped version',
                    trailing_ws => \$self->trailing_whitespace
                },
            ),
        )
    );
    return;
}

sub register_prereqs
{
    my $self = shift;
    $self->zilla->register_prereqs(
        {
            type  => 'requires',
            phase => 'develop',
        },
        'Test::More' => 0,
        'Test::EOL' => 0,
    );
}

__PACKAGE__->meta->make_immutable;

1;
# ABSTRACT: Author tests making sure correct line endings are used
# SEEALSO: Test::EOL, Dist::Zilla::Plugin::EOLTests

#pod =head1 DESCRIPTION
#pod
#pod Generate an author L<Test::EOL>.
#pod
#pod This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing
#pod the following files:
#pod
#pod =for :list
#pod * xt/author/eol.t
#pod a standard Test::EOL test
#pod
#pod =head1 CONFIGURATION OPTIONS
#pod
#pod This plugin accepts the following options:
#pod
#pod =head2 C<trailing_whitespace>
#pod
#pod If this option is set to a true value,
#pod C<< { trailing_whitespace => 1 } >> will be passed to
#pod L<Test::EOL/all_perl_files_ok>. It defaults to C<1>.
#pod
#pod What this option is going to do is test for the lack of trailing whitespace at
#pod the end of the lines (also known as "trailing space").
#pod
#pod =head2 C<filename>
#pod
#pod The filename of the test to add - defaults to F<xt/author/test-eol.t>.
#pod
#pod =for Pod::Coverage gather_files register_prereqs
#pod
#pod =head1 ACKNOWLEDGMENTS
#pod
#pod This module is a fork of L<Dist::Zilla::Plugin::EOLTests> and was originally
#pod written by Florian Ragwitz. It was forked because the Test:: namespace
#pod is preferred for test modules, and because I would prefer to have EOL tests
#pod be Author tests.
#pod
#pod =cut

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::Test::EOL - Author tests making sure correct line endings are used

=head1 VERSION

version 0.16

=head1 DESCRIPTION

Generate an author L<Test::EOL>.

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing
the following files:

=over 4

=item *

xt/author/eol.t

a standard Test::EOL test

=back

=head1 CONFIGURATION OPTIONS

This plugin accepts the following options:

=head2 C<trailing_whitespace>

If this option is set to a true value,
C<< { trailing_whitespace => 1 } >> will be passed to
L<Test::EOL/all_perl_files_ok>. It defaults to C<1>.

What this option is going to do is test for the lack of trailing whitespace at
the end of the lines (also known as "trailing space").

=head2 C<filename>

The filename of the test to add - defaults to F<xt/author/test-eol.t>.

=for Pod::Coverage gather_files register_prereqs

=head1 ACKNOWLEDGMENTS

This module is a fork of L<Dist::Zilla::Plugin::EOLTests> and was originally
written by Florian Ragwitz. It was forked because the Test:: namespace
is preferred for test modules, and because I would prefer to have EOL tests
be Author tests.

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

L<Test::EOL|Test::EOL>

=item *

L<Dist::Zilla::Plugin::EOLTests|Dist::Zilla::Plugin::EOLTests>

=back

=head1 CONTRIBUTORS

=for stopwords Olivier Mengué Shlomi Fish

=over 4

=item *

Olivier Mengué <dolmen@cpan.org>

=item *

Shlomi Fish <shlomif@shlomifish.org>

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

__DATA__
___[ __TEST__ ]___
use strict;
use warnings;
use Test::More;

# generated by {{ $name }} {{ $version }}
use Test::EOL;

all_perl_files_ok({ trailing_whitespace => {{ $trailing_ws }} });
