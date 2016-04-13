? block content => sub {
? for my $job ( $c->stash->{jobs}->all ) {
<?= $job->id ?>
? } # end for
? } # end block content

