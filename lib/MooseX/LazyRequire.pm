package MooseX::LazyRequire;
our $VERSION = '0.01';

# ABSTRACT: Required attributes which fail only when trying to use them

use Moose::Exporter;
use aliased 'MooseX::LazyRequire::Meta::Attribute::Trait::LazyRequire';
use namespace::autoclean;


Moose::Exporter->setup_import_methods;

sub init_meta {
    my ($class, %options) = @_;
    return Moose::Util::MetaRole::apply_metaclass_roles(
        for_class                 => $options{for_class},
        attribute_metaclass_roles => [LazyRequire],
    );
}


__END__

=pod

=head1 NAME

MooseX::LazyRequire - Required attributes which fail only when trying to use them

=head1 VERSION

version 0.01

=head1 SYNOPSIS

    package Foo;

    use Moose;
    use MooseX::LazyRequire;

    has foo => (
        is           => 'ro',
        lazy_require => 1,
    );

    has bar => (
        is      => 'ro',
        builder => '_build_bar',
    );

    sub _build_bar { shift->foo }

    Foo->new(foo => 42); # succeeds, foo and bar will be 42
    Foo->new(bar => 42); # succeeds, bar will be 42
    Foo->new;            # fails, neither foo nor bare were given

=head1 DESCRIPTION

This module adds a C<lazy_require> option to Moose attribute declarations.

The reader methods for all attributes with that option will throw an exception
unless a value for the attributes was provided earlier by a constructor
parameter or through a writer method.

=head1 CAVEATS

Apparently Moose roles don't have an attribute metaclass, so this module can't
easily apply its magic to attributes defined in roles. If you want to use
C<lazy_require> in role attributes, you'll have to apply the attribute trait
yourself:

    has foo => (
        traits       => ['LazyRequire'],
        is           => 'ro',
        lazy_require => 1,
    );



=begin Pod::Coverage

init_meta

=end Pod::Coverage

1;

=head1 AUTHOR

  Florian Ragwitz <rafl@debian.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Florian Ragwitz.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut 


