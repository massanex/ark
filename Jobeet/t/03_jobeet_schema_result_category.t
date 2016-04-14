use v5.18.2;
use strict;
use warnings;
use Test::More tests => 2;

use Jobeet::Test;
use Jobeet::Models;

{
    my $new_category = models('Schema::Category')->create({
        name => 'CamelCase',
    });

    is $new_category->slug, 'camel_case', 'slug column: create slug column automatically.';

    $new_category->name('UpdatedCategoryName');
    $new_category->update;

    is $new_category->slug, 'updated_category_name', 'slug column: update slug column automatically';

}

done_testing;
