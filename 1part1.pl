use warnings;
use strict;

my $file = "input/1.txt";

my $x = 0;
my $y = 0;
my $facing = 0;

open (my $fh, '<', $file) or die "Cant open file $!";
my $input = <$fh>;
close $fh;
my @directions = split /, /, $input;

foreach(@directions){
	my ($dir, $distance) = split(//, $_, 2);
	if($dir eq 'R'){
		$facing++;
	}else{
		$facing--;
	}

	$facing = $facing % 4;

	if($facing == 0){ $y+=$distance; }
	elsif($facing == 1){ $x+=$distance; }
	elsif($facing == 2){ $y-=$distance; }
	else{ $x-=$distance; }
 
}

print "x = $x, y = $y\n";
print abs($x)+abs($y);