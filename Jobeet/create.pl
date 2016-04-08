use v5.20.3;
use strict;
use warnings;

use Jobeet::Schema;

my $schema = Jobeet::Schema->connect('dbi:SQLite:./test.db');

my $category_rs = $schema->resultset('Category');
say $category_rs->count;

my $category = $category_rs->create({
    name => 'name ' . localtime ,
});

say sprintf ("id:%s name:%s", $category->id, $category->name);
