#!/usr/bin/perl

use strict;
use warnings;

# Art of Change
#
# This Perl code is part of a larger program that demonstrates 
# the power of the Art of Change. This code performs a 
# variety of operations that transform a given set of data 
# into a new set of data.

# Variables
my @data_in;
my @data_out;
my $min;
my $max;
my $i;

# Read in the data
open(DATA, "<data_in.txt") or die "Can't open data: $!";
while (my $line = <DATA>) {
    push @data_in, $line;
}
close DATA;

# Find the minimum and maximum values
$min = $data_in[0];
$max = $min;
foreach my $data (@data_in) {
    if ($data < $min) {
        $min = $data;
    } 
    if ($data > $max) {
        $max = $data;
    }
}

# Transform the data
for ($i = 0; $i < @data_in; $i++) {
    $data_out[$i] = (2 * ($data_in[$i] - $min)) / ($max - $min) - 1;
}

# Write the transformed data to file
open(DATA, ">data_out.txt") or die "Can't open data: $!";
foreach my $data (@data_out) {
    print DATA "$data\n";
}
close DATA;

# Print the results
print "Minimum value is $min\n";
print "Maximum value is $max\n";
print "Transformed data has been written to data_out.txt\n";