package MooseX::LazyRequire::Meta::Attribute::Trait::LazyRequire;
our $VERSION = '0.02';


use Moose::Role;
use Carp qw/cluck/;
use MooseX::Types::Moose qw/Bool/;
use namespace::autoclean;

has lazy_required => (
    is       => 'ro',
    isa      => Bool,
    required => 1,
    default  => 0,
);

has lazy_require => (
    is       => 'bare',
);

after _process_options => sub {
    my ($class, $name, $options) = @_;

    if (exists $options->{lazy_require}) {
        cluck "deprecated option 'lazy_require' used. use 'lazy_required' instead.";
        $options->{lazy_required} = delete $options->{lazy_require};
    }

    return unless $options->{lazy_required};

    Moose->throw_error(
        "You may not use both a builder or a default and lazy_required for one attribute ($name)",
        data => $options,
    ) if $options->{builder};

    $options->{ lazy     } = 1;
    $options->{ required } = 1;
    $options->{ default  } = sub {
        confess "Attribute $name must be provided before calling reader"
    };
};

package # hide
    Moose::Meta::Attribute::Custom::Trait::LazyRequire;

sub register_implementation { 'MooseX::LazyRequire::Meta::Attribute::Trait::LazyRequire' }

1;

__END__

=pod

=head1 NAME

MooseX::LazyRequire::Meta::Attribute::Trait::LazyRequire

=head1 VERSION

version 0.02

=head1 AUTHOR

  Florian Ragwitz <rafl@debian.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Florian Ragwitz.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut 

