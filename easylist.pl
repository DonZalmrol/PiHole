#!/usr/bin/perl -w

# Source 01 : https://www.reddit.com/r/pihole/comments/4p2tp7/adding_easylist_and_other_adblocklike_sources_to/
# Source 02 : https://newspaint.wordpress.com/2014/08/18/filtering-easylist-for-hosts-file-style-adblock/

use strict;

my %hosts = ();

while ( <> )
{
        if ( $_ =~ m/^\|\|([a-z][a-z0-9-_.]+\.([a-z]{2,3}))\^\s*$/ )
        {
                $hosts{$1} = 1;
        }
}

foreach my $host ( sort keys %hosts )
{
        print( "$host\n" );
}
