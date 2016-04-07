use v5.18.2;
use strict;
use warnings;
use utf8;

use Jobeet::Schema;
# SQLite
my $schema = Jobeet::Schema->connect('dbi:SQLite:./test.db');
# MySQL
#my $schema = Jobeet::Schema->connect(
#    'dbi:mysql:jobeetdb',
#    'root',
#    '',
#);
$schema->deploy;
