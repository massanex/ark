package Jobeet::Controller::Job;
use v5.18.2;
use Ark 'Controller';
with 'Ark::ActionClass::Form';

use Jobeet::Models;

# / （トップ）
sub index :Path {
    my ($self, $c) = @_;

    # SELECT ALL
    #$c->stash->{jobs} = models('Schema::Job');
    # 30日以内の投稿
    #$c->stash->{jobs} = models('Schema::Job')->search({
    #   created_at => { '>=', models('Schema')->now->add( days => -30 ) },
    #);
    # 30日以内の投稿、条件expires_at
    #$c->stash->{jobs} = models('Schema::Job')->search({
    #    expires_at => { '>=', models('Schema')->now },
    #});
    # Jobeet::Schema::ResultSet::Job の get_active_jobs を実行
    #$c->stash->{jobs} = models('Schema::Job')->get_active_jobs;
    # Jobeet::Schema::ResultSet::Category の get_with_jobs を実行
    $c->stash->{categories} = models('Schema::Category')->get_with_jobs;
}

# Form用
sub create :Local :Form('Jobeet::Form::Job') {
    my ($self, $c) = @_;

    #$c->stash->{form} = $self->form;
    if ($c->req->method eq 'POST' and $self->form->submitted_and_valid) {
        my $job = models('Schema::Job')->create_from_form($self->form);
        $c->redirect( $c->uri_for('/job', $job->token) );
    }
}

# Form編集用
sub job :Chained('/') :PathPart :CaptureArgs(1) {
    my ($self, $c, $job_token) = @_;

    $c->stash->{job} = models('Schema::Job')->find({ token => $job_token })
        or $c->detach('/default');
}

# Form編集用
sub edit :Chained('job') :PathPart :Form('Jobeet::Form::Job') {
    my ($self, $c) = @_;

    my $job = $c->stash->{job};

    if ($c->req->method eq 'POST') {
        if ($self->form->submitted_and_valid) {
            $job->update_from_form($self->form);
            $c->redirect( $c->uri_for('/job', $job->token) );
        }
    }
    else {
        $self->form->fill({
            $job->get_columns,
            category => $job->category->name,
        });
    }
}

# Form確認用詳細
#sub show :Path :Args(1) {
#    my ($self, $c, $job_token) = @_;
#
#    $c->stash->{job} = models('Schema::Job')->find({ token => $job_token })
#        or $c->detach('/default');
#}
sub show :Path :Args(1) {
    my ($self, $c, $job_token) = @_;

    $c->stash->{job} = models('Schema::Job')->find({ token => $job_token })
        or $c->detach('/default');

    my $history = $c->session->get('job_history') || [];

    unshift @$history, { $c->stash->{job}->get_columns };

    $c->session->set( job_history => $history );
}

# Form 削除用
sub delete :Chained('job') :PathPart {
    my ($self, $c) = @_;

    $c->stash->{job}->delete;
    $c->redirect( $c->uri_for('/job') );
}

# JOB公開用
sub publish :Chained('job') :PathPart {
    my ($self, $c) = @_;

    my $job = $c->stash->{job};

    $job->publish;
    $c->redirect( $c->uri_for('/job', $job->token) );
}

1;
