package Jobeet::Models;
use v5.18.2;
use strict;
use warnings;
use Ark::Models '-base';

register Schema => sub {
    my $self = shift;

    my $conf = $self->get('conf')->{database}
        or die 'require database config';

    $self->ensure_class_loaded('Jobeet::Schema');
    Jobeet::Schema->connect(@$conf);
};

#for my $table (qw/Job Category CategoryAffiliate Affiliate/) {
#    register "Schema::$table" => sub {
#        my $self = shift;
#        $self->get('Schema')->resultset($table);
#    };
#}

autoloader qr/^Schema::/ => sub {
    my ($self, $name) = @_;

    my $schema = $self->get('Schema');
    for my $t ($schema->sources) {
        $self->register( "Schema::$t" => sub { $schema->resultset($t) });
    }
};

1;
