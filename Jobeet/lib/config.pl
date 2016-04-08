my $home = Jobeet::Models->get('home');

# SQLite
return {
    database => [
        'dbi:SQLite:' . $home->file('database.db'), '', '',
         {
             sqlite_unicode => 1,
         },
    ],
};

# MySQL
#return {
#    database => [
#        'dbi:mysql:jobeetdb', 'root', '',
#         {
#             mysql_enable_utf8 => 1,
#             on_connect_do     => ['SET NAMES utf8'],
#         },
#    ],
#};
## test4
