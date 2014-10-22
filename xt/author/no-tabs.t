use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::NoTabs 0.09

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'lib/Dist/Zilla/Plugin/EOLTests.pm',
    'lib/Dist/Zilla/Plugin/Test/EOL.pm',
    't/00-report-prereqs.dd',
    't/00-report-prereqs.t',
    't/01-basic.t',
    't/02-eoltests.t',
    'xt/author/00-compile.t',
    'xt/author/clean-namespaces.t',
    'xt/author/critic.t',
    'xt/author/no-tabs.t',
    'xt/author/pod-spell.t',
    'xt/author/test-eol.t',
    'xt/release/changes_has_content.t',
    'xt/release/cpan-changes.t',
    'xt/release/distmeta.t',
    'xt/release/kwalitee.t',
    'xt/release/meta-json.t',
    'xt/release/minimum-version.t',
    'xt/release/mojibake.t',
    'xt/release/pod-coverage.t',
    'xt/release/pod-no404s.t',
    'xt/release/pod-syntax.t',
    'xt/release/portability.t',
    'xt/release/test-version.t',
    'xt/release/unused-vars.t'
);

notabs_ok($_) foreach @files;
done_testing;
