#!/usr/bin/perl

use strict;

my $total = 0;
my $count = 0;
while (my $line = <>) {
      $total += $line;
      $count++;
}
print "Average = ", $total / $count, "\n";
