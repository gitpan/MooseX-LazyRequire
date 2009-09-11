
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'MooseX-LazyRequire',
  NAME      => 'MooseX::LazyRequire',
  AUTHOR    => 'Florian\ Ragwitz\ \<rafl\@debian\.org\>',
  ABSTRACT  => 'Required\ attributes\ which\ fail\ only\ when\ trying\ to\ use\ them',
  VERSION   => '0.04',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "MooseX::Types::Moose" => '0',
    "Test::More" => '0.88',
    "namespace::autoclean" => '0',
    "aliased" => '0.30',
    "Moose" => '0',
  },
);
