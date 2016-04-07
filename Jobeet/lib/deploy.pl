use v5.18.2;
use strict;
use warnings;
use utf8;

use Jobeet::Schema;
my $schema = Jobeet::Schema->connect('dbi:SQLite:./test.db');
$schema->deploy;
