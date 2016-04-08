package Jobeet::Schema::Result::Something;
use v5.18.2;
use strict;
use warnings;
use parent 'Jobeet::Schema::ResultBase';
use Jobeet::Schema::Types;

__PACKAGE__->table('jobeet_something');

__PACKAGE__->add_columns(
    json_column1 => VARCHAR,
    json_column2 => VARCHAR,
);

__PACKAGE__->inflate_json_column(qw/json_column1 json_column2/);

1;
