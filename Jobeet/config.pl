#+{
#    default_view => 'MT',
#}

#my $home = Jobeet::Models->get('home');

# SQLite
#return {
#     database => [
#         'dbi:SQLite:' . $home->file('database.db'), '', '',
#         {
#             sqlite_unicode => 1,
#         },
#    ],
#};

return {
    default_view => 'MT',
    active_days => 30,
    max_jobs_on_homepage => 10,
    database => [
        'dbi:mysql:jobeetdb', 'root', '',
         {
             mysql_enable_utf8 => 1,
             on_connect_do     => ['SET NAMES utf8'],
         },
    ],
};
