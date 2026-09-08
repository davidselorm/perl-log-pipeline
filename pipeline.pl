#!/usr/bin/env perl
use strict;
use warnings;

package LogPipeline;

sub parse_log_line {
    my ($line) = @_;
    # Common Log Format regex: host rfc931 authuser [date] "request" status bytes
    if ($line =~ /^(\S+) \S+ \S+ \[(.*?)\] "(.*?)" (\d{3}) (\S+)/) {
        return {
            ip      => $1,
            time    => $2,
            request => $3,
            status  => int($4),
            bytes   => ($5 eq '-' ? 0 : int($5))
        };
    }
    return undef;
}

sub summarize {
    my (@records) = @_;
    my %status_counts;
    my $total_bytes = 0;

    for my $r (@records) {
        next unless defined $r;
        $status_counts{$r->{status}}++;
        $total_bytes += $r->{bytes};
    }

    return {
        total_records => scalar(@records),
        total_bytes   => $total_bytes,
        status_dist   => \%status_counts
    };
}

1;
