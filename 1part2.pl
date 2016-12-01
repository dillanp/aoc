use warnings;
use strict;

use Data::Dumper;

my $input = "R4, R3, L3, L2, L1, R1, L1, R2, R3, L5, L5, R4, L4, R2, R4, L3, R3, L3, R3, R4, R2, L1, R2, L3, L2, L1, R3, R5, L1, L4, R2, L4, R3, R1, R2, L5, R2, L189, R5, L5, R52, R3, L1, R4, R5, R1, R4, L1, L3, R2, L2, L3, R4, R3, L2, L5, R4, R5, L2, R2, L1, L3, R3, L4, R4, R5, L1, L1, R3, L5, L2, R76, R2, R2, L1, L3, R189, L3, L4, L1, L3, R5, R4, L1, R1, L1, L1, R2, L4, R2, L5, L5, L5, R2, L4, L5, R4, R4, R5, L5, R3, L1, L3, L1, L1, L3, L4, R5, L3, R5, R3, R3, L5, L5, R3, R4, L3, R3, R1, R3, R2, R2, L1, R1, L3, L3, L3, L1, R2, L1, R4, R4, L1, L1, R3, R3, R4, R1, L5, L2, R2, R3, R2, L3, R4, L5, R1, R4, R5, R4, L4, R1, L3, R1, R3, L2, L3, R1, L2, R3, L3, L1, L3, R4, L4, L5, R3, R5, R4, R1, L2, R3, R5, L5, L4, L1, L1";

my $test = "R8, R4, R4, R8";

my $x = 0;
my $y = 0;
my $facing = 0; #0-N,1-E,2-S,3-W

my %visited;

$visited{$x.$y}++;

my @directions = split /, /, $input;

foreach(@directions){
	my ($dir, $distance) = split(//, $_, 2);
	
	if($dir eq 'R'){ $facing++; }
	else{ $facing--; }

	$facing = $facing % 4;

	foreach(1..$distance){
		if($facing == 0){ die "$x $y " if exists $visited{$x.++$y}; }
		elsif($facing == 1){ die "$x $y " if exists $visited{++$x.$y}; }
		elsif($facing == 2){ die "$x $y " if exists $visited{$x.--$y}; }
		elsif($facing == 3){ die "$x $y " if exists $visited{--$x.$y}; }
		$visited{$x.$y}++;
	}
 
}

