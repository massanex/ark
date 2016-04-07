use v5.18.2;
use strict;
use warnings;
use utf8;

use Jobeet::Schema;

# SQLite
#my $schema = Jobeet::Schema->connect('dbi:SQLite:./test.db');

# MySQL
my $schema = Jobeet::Schema->connect(
	'dbi:mysql:jobeetdb',
	'root',
	'',
);
# CONNECT
my $category_rs = $schema->resultset('Category');
# COUNT
#print $category_rs->count;
# SELECT ALL
#my @all_categories = $schema->resultset('Category')->all;
#foreach my $category (@all_categories) {
#	print $category->name, "\n";
#}
## SELECT
#my $category = $schema->resultset('Category')->search({ name => 'new category' });
#while (my $aaa = $category_rs->next) {
#	print $aaa->name;
#}
# Dump
#use Data::Dumper;
#print Dumper $category;
# INSERT
#my $category = $category_rs->new({ name => 'new category2' });
my $category = $category_rs->create({ name => 'new category2' });
## UPDATE
#$category_rs->update({ name => 'new category2' });
## DELETE
#$category_rs->search({ name => 'new category' })->delete();


