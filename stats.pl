#!/usr/bin/env perl
use strict;
use warnings;
require "./pipeline.pl";

my $sample = '127.0.0.1 - - [08/Sep/2026:02:20:00 +0000] "GET /api/v1/health HTTP/1.1" 200 128';
my $parsed = LogPipeline::parse_log_line($sample);

if ($parsed && $parsed->{status} == 200) {
    print "[PASS] Perl Log Pipeline successfully tokenized Common Log Format.\n";
}
