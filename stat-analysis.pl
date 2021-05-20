#!/usr/bin/perl

use strict;

my @values = <>;

my $total = 0;
my $count = 0;
while (my $value = <@values>) {
    $total += $value;
    $count++;
}

my $average = $total / $count;
my $variance = 0;
while (my $value = <@values>) {
    $variance += ($value - $average)**2 / $count;
}

print "Average = ", $average, "\n";
print "Variance = ", $variance, "\n";
print "Standard Deviation = ", sqrt($variance), "\n";
