package LogStats;
use strict;
use warnings;

our %counts = ( ERROR => 0, WARN => 0, INFO => 0 );
sub record {
    my ($level) = @_;
    $counts{$level}++ if exists $counts{$level};
}
1;
