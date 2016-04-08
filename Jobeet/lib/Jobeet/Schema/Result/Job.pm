package Jobeet::Schema::Result::Job;
use v5.18.2;
use strict;
use warnings;
use parent 'Jobeet::Schema::ResultBase';
use Jobeet::Schema::Types;

__PACKAGE__->table('jobeet_job');

__PACKAGE__->add_columns(
    id		=> PK_INTEGER,
    category_id	=> INTEGER,
    type	=> VARCHAR(is_nullable => 1,),
    position	=> VARCHAR,
    location	=> VARCHAR,
    description	=> {
	data_type	=> 'TEXT',
	is_nullable	=> 0,
    },
    how_to_apply	=> {
	data_type	=> 'TEXT',
	is_nullable	=> 0,
    },
    token	=> VARCHAR,
    is_public	=> TINYINT(default_value => 1,),
    is_activated	=> TINYINT,
    email	=> VARCHAR,
    expires_at	=> DATETIME,
    created_at	=> DATETIME,
    updated_at	=> DATETIME,
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint(['token']);

__PACKAGE__->belongs_to( category => 'Jobeet::Schema::Result::Category', 'category_id' );

1;
