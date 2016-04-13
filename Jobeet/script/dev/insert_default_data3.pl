use v5.18.2;
use strict;
use warnings;
use FindBin::libs;

use Jobeet::Models;

my $job_rs = models('Schema::Job');
my $cat_rs = models('Schema::Category');

my $cat_programming = $cat_rs->find({ name => 'Programming' });

for my $i (100 .. 130) {
    my $job = $job_rs->create({
        category_id  => $cat_programming->id,
        company      => "Company $i",
        position     => 'Web Developer',
        location     => 'Paris, France',
        description  => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.',
        how_to_apply => "Send your resume to lorem.ipsum [at] company_${i}.sit",
        is_public    => 1,
        is_activated => 1,
        token        => "job_$i",
        email        => 'job@example.com',
    });
}
