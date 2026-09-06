#!/usr/bin/env perl
use strict;
use warnings;

sub parse_log_line {
    my ($line) = @_;
    if ($line =~ /^\[(ERROR|WARN|INFO)\]\s+(\S+):\s+(.*)$/) {
        return { level => $1, module => $2, message => $3 };
    }
    return undef;
}
print "Perl Log Pipeline Initialized.\n";
