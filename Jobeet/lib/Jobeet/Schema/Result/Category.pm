package Jobeet::Schema::Result::Category;
use v5.18.2;
use strict;
use warnings;
use parent 'Jobeet::Schema::ResultBase';
use Jobeet::Schema::Types;

__PACKAGE__->table('jobeet_category');

__PACKAGE__->add_columns(
    id		=> PK_INTEGER,
    name	=> VARCHAR,
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint(['name']);

__PACKAGE__->has_many( jobs => 'Jobeet::Schema::Result::Job', 'category_id' );
__PACKAGE__->has_many(
    category_affiliate => 'Jobeet::Schema::Result::CategoryAffiliate', 'category_id',
    {
        is_foreign_key_constraint   => 0,
        cascade_delete              => 0,
    },
 );

__PACKAGE__->many_to_many( affiliates => category_affiliate => 'affiliate' );

1;
