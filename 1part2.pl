use warnings;
use strict;

use Data::Dumper;

my $file = "input/1.txt";

open (my $fh, '<', $file) or die "Cant open file $!";
my $input = <$fh>;
close $fh;

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
		if($facing == 0){ die "Visited $x $y already" if exists $visited{$x.++$y}; }
		elsif($facing == 1){ die "Visited $x $y already" if exists $visited{++$x.$y}; }
		elsif($facing == 2){ die "Visited $x $y already" if exists $visited{$x.--$y}; }
		elsif($facing == 3){ die "Visited $x $y already" if exists $visited{--$x.$y}; }
		$visited{$x.$y}++;
	}
 
}