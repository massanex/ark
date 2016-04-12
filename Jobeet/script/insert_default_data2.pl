#!/usr/bin/env perl

use strict;
use warnings;
use FindBin::libs;

use Jobeet::Models;
use DateTime;

my $job_rs = models('Schema::Job');
my $cat_rs = models('Schema::Category');

my $cat_programming = $cat_rs->find({ name => 'Programming' });
my $job = $job_rs->create({
    category_id  => $cat_programming->id,
    company      => 'Sensio Labs',
    position     => 'Web Developer',
    location     => 'Paris, France',
    description  => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.',
    how_to_apply => 'Send your resume to lorem.ipsum [at] dolor.sit',
    is_public    => 1,
    is_activated => 1,
    token        => 'job_expired',
    email        => 'job@example.com',
});
$job->update({
    created_at => '2005-12-01',
    expires_at => '2005-12-31',
});
