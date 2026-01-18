#!/usr/bin/env perl

use strict;
use warnings;

my $command = shift @ARGV;

if ($command eq 'build') {
    system('typst', 'compile', 'main.typ') == 0 or die "Failed to build: $!\n";
} else {
    die "Usage: $0 build\n";
}
