package Dist::Zilla::Plugin::Test::EOL;
use Moose;
use namespace::autoclean;

our $VERSION = '0.03'; # VERSION

extends 'Dist::Zilla::Plugin::InlineFiles';
with 'Dist::Zilla::Role::TextTemplate';


has trailing_whitespace => (
    is      => 'ro',
    isa     => 'Bool',
    default => 1,
);

around add_file => sub {
    my ($orig, $self, $file) = @_;
    return $self->$orig(
        Dist::Zilla::File::InMemory->new({
            name    => $file->name,
            content => $self->fill_in_string(
                $file->content,
                { trailing_ws => \$self->trailing_whitespace },
            ),
        }),
    );
};

__PACKAGE__->meta->make_immutable;

1;
# ABSTRACT: Author tests making sure correct line endings are used




=pod

=head1 NAME

Dist::Zilla::Plugin::Test::EOL - Author tests making sure correct line endings are used

=head1 VERSION

version 0.03

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing
the following files:

=head1 ATTRIBUTES

=head2 trailing_whitespace

If this option is set to a true value,
C<< { trailing_whitespace => 1 } >> will be passed to
L<Test::EOL/all_perl_files_ok>. It defaults to C<1>.

=for :list * xt/author/eol.t
a standard Test::EOL test

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
https://github.com/rafl/dist-zilla-plugin-eoltests/issues

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHORS

=over 4

=item *

Florian Ragwitz <rafl@debian.org>

=item *

Caleb Cushing <xenoterracide@gmail.com>

=back

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2011 by Caleb Cushing.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut


__DATA__
___[ xt/author/test-eol.t ]___
use strict;
use warnings;
use Test::More;
use Test::Requires qw( Test::EOL );

all_perl_files_ok({ trailing_whitespace => {{ $trailing_ws }} });
