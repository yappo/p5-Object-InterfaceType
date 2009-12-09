package Object::InterfaceType;
use strict;
use warnings;
use base 'Exporter';
our @EXPORT = 'interface_type';
our $VERSION = '0.01';

use Scalar::Util 'blessed';

sub interface_type {
    my($typename, $methods) = @_;
    my $caller = caller(0);
    $methods = [] unless $methods && ref($methods) eq 'ARRAY';

    my $code = sub {
        my $obj = shift;
        my $class = blessed $obj;
        return unless $class;

        for my $method (@{ $methods }) {
            return unless $class->can($method);
        }
        return 1;
    };

    no strict 'refs';
    *{"$caller\::is_$typename"} = $code;
}

1;
__END__

=encoding utf8

=head1 NAME

Object::InterfaceType - the Go lang Interface style duck type checker

=head1 SYNOPSIS

  use Object::InterfaceType;

  interface_type Stringify => ['as_string'];
  is_Stringify(URI->new) ? 'ok' : 'ng';

=head1 DESCRIPTION

Object::InterfaceType is

=head1 AUTHOR

Kazuhiro Osawa E<lt>yappo <at> shibuya <döt> plE<gt>

=head1 SEE ALSO

=head1 REPOSITORY

  svn co http://svn.coderepos.org/share/lang/perl/Object-InterfaceType/trunk Object-InterfaceType

Object::InterfaceType is Subversion repository is hosted at L<http://coderepos.org/share/>.
patches and collaborators are welcome.

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
