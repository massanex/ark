use v5.20.3;
use strict;
use warnings;
use utf8;
use lib 'lib';

use Jobeet::Schema;

my $schema = Jobeet::Schema->connect('dbi:SQLite:./test.db');
$schema->deploy;
