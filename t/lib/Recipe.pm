# $Id$

package Recipe;
use strict;
use base qw( Data::ObjectDriver::BaseObject );

use Data::ObjectDriver::Driver::DBI;

__PACKAGE__->install_properties({
    columns => [ 'id', 'cluster_id', 'title' ],
    datasource => 'recipes',
    primary_key => 'id',
    driver => Data::ObjectDriver::Driver::DBI->new(
        dsn      => 'dbi:mysql:database=global',
        username => 'btrott',
    ),
});

sub insert {
    my $obj = shift;
    ## Choose a cluster for this recipe. This isn't a very solid way of
    ## doing this, but it works for testing.
    $obj->cluster_id(int(rand 2) + 1);
    $obj->SUPER::insert(@_);
}

1;
