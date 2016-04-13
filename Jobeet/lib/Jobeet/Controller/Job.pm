package Jobeet::Controller::Job;
use v5.18.2;
use Ark 'Controller';

use Jobeet::Models;
#has '+namespace' => default => 'job';
#
#sub auto :Private {
#    1;
#}
#
#sub index :Path :Args(0) {
#    my ($self, $c) = @_;
#}
#
#__PACKAGE__->meta->make_immutable;

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

# /job/{job_token} （詳細）
sub show :Path :Args(1) {
    my ($self, $c, $job_token) = @_;
}

# /job/create （新規作成）
sub create :Local {
    my ($self, $c) = @_;
}

sub job :Chained('/') :PathPart :CaptureArgs(1) {
    my ($self, $c, $job_token) = @_;
    $c->stash->{job_token} = $job_token;
}

# /job/{job_token}/edit （編集）
sub edit :Chained('job') :PathPart :Args(0) {
    my ($self, $c) = @_;
}

# /job/{job_token}/delete （削除）
sub delete :Chained('job') :PathPart :Args(0) {
    my ($self, $c) = @_;
}

1;
