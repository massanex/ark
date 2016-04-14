use v5.18.2;
use strict;
use warnings;

use Test::More;
use Jobeet::Test;
use Jobeet::Models;

my $datafile = models('home')->subdir(qw/sql fixtures/)->file('default.pl');
do $datafile or die $!;

# アクションがただしく呼ばれるかどうか
{
    my $c = ctx_get('/category/foo');
    is $c->req->action->reverse, 'category/show', 'action called ok';
}

# 存在しない場合ただしく404ページが表示されるかどうか
{
    my $c = ctx_get('/category/foo');
    is $c->req->action->reverse, 'category/show', 'action called ok';
    is $c->res->status, '404', '404 status ok';
    ok !$c->stash->{category}, 'category not set';
    ok !$c->stash->{jobs}, 'jobs not set';
}

# 存在するカテゴリの場合 stash にただしくデータが入っているかどうか
{
    my $c = ctx_get('/category/design');
    is $c->req->action->reverse, 'category/show', 'action called ok';
    is $c->res->status, '200', '200 status ok';
    isa_ok $c->stash->{category}, 'Jobeet::Schema::Result::Category';
    isa_ok $c->stash->{jobs}, 'Jobeet::Schema::ResultSet::Job';
    is $c->stash->{category}->slug, 'design', 'slug ok';
}

# ページャのテスト
{
    my $c = ctx_get('/category/programming');
    is $c->stash->{jobs}->pager->current_page, 1, 'current page 1 ok';
}

{
    my $c = ctx_get('/category/programming?page=2');
    is $c->stash->{jobs}->pager->current_page, 2, 'current page 2 ok';
}

done_testing;
