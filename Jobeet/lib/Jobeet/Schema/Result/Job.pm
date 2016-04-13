package Jobeet::Schema::Result::Job;
use v5.18.2;
use strict;
use warnings;
use parent 'Jobeet::Schema::ResultBase';
use Jobeet::Schema::Types;
use Jobeet::Models;

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
    company => {
        data_type   => 'VARCHAR',
        size        => 255,
        is_nullable => 1,
    },
    logo => {
        data_type   => 'VARCHAR',
        size        => 255,
        is_nullable => 1,
    },
    url => {
        data_type   => 'VARCHAR',
        size        => 128,
        is_nullable => 1,
    },
    expires_at	=> DATETIME,
    created_at	=> DATETIME,
    updated_at	=> DATETIME,
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint(['token']);

__PACKAGE__->belongs_to( category => 'Jobeet::Schema::Result::Category', 'category_id' );

sub insert {
    my $self = shift;

    #$self->expires_at( models('Schema')->now->add( days => 30 ) );
    #$self->next::method(@_);
    $self->expires_at( models('Schema')->now->add( days => models('conf')->{active_days} ) );
    $self->next::method(@_);
}

1;
