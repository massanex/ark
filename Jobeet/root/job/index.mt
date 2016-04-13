? extends 'common/base';
? extends 'common/jobs_base';

#? block content => sub {

#? for my $category ($c->stash->{categories}) {

        <h1>
          <?=# $category->name ?>
          <a href="<?=# $c->uri_for('/category', $category->slug) ?>">
            <?=# $category->name ?>
          </a>
        </h1>

?=# include('job/_partial_jobs', $category->get_active_jobs({ rows => $max_rows }));

?# } # end for


<div id="jobs">
  <table class="jobs">
?# my $i = 0;
?# for my $job ($c->stash->{jobs}->all) {
?# $i++;
      <tr class="<?=# $i % 2 == 0 ? 'even' : 'odd' ?>">
        <td class="location"><?=# $job->location ?></td>
        <td class="position">
          <a href="<?=# $c->uri_for('/job', $job->id) ?>">
            <?=# $job->position ?>
          </a>
        </td>
        <td class="company"><?=# $job->company ?></td>
      </tr>
?# } # end for
</table>
</div>

#? } # endblock content
