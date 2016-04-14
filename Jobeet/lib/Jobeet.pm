package Jobeet;
use Ark;
use Data::Page::Navigation;

use_model 'Jobeet::Models';
# 15日目のセッション
use_plugins qw{
    Session
    Session::State::Cookie
    Session::Store::Model
};
config 'Plugin::Session' => {
    expires => '+30d',
};

config 'Plugin::Session::State::Cookie' => {
    cookie_name => 'jobeet_session',
};

config 'Plugin::Session::Store::Model' => {
    model => 'cache',
};
our $VERSION = '0.01';

__PACKAGE__->meta->make_immutable;

__END__

=head1 NAME

Jobeet -

=head1 SYNOPSIS

use Jobeet;

=head1 DESCRIPTION

Jobeet is

=head1 AUTHOR

saito E<lt>fotome-saito@co.kayac.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
