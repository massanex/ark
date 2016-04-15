package Jobeet::Controller::Search;
use v5.18.2;
use Ark 'Controller';

use Jobeet::Models;

sub index :Path {
    my ($self, $c) = @_;

    my $query = $c->req->param('q')
        or $c->detach('/default');

    $c->stash->{jobs} = models('Schema::Job')->search_fulltext($query);
}

1;
