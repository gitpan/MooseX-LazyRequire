use strict;
use warnings;
use Test::More;

# generated by Dist::Zilla::Plugin::Test::PodSpelling 2.006008
use Test::Spelling 0.12;
use Pod::Wordlist;


add_stopwords(<DATA>);
all_pod_files_spelling_ok( qw( bin lib  ) );
__DATA__
getters
Florian
Ragwitz
rafl
Dave
Rolsky
autarch
Karen
Etheridge
ether
David
Precious
davidp
Jesse
Luehrs
doy
lib
MooseX
LazyRequire
Meta
Attribute
Trait