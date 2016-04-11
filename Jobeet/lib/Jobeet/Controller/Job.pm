package Jobeet::Controller::Job;
use Ark 'Controller';

use Jobeet::Models;
has '+namespace' => default => 'job';

sub auto :Private {
    1;
}

sub index :Path :Args(0) {
    my ($self, $c) = @_;
}

__PACKAGE__->meta->make_immutable;

