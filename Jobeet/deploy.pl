use v5.18.2;
use strict;
use warnings;
use utf8;

# SQLite
use Jobeet::Schema;
#my $schema = Jobeet::Schema->connect('dbi:SQLite:./test.db');

# MySQL
my $schema = Jobeet::Schema->connect(
    'dbi:mysql:jobeetdb',
    'root',
    '',
);

# 実行
$schema->deploy;
