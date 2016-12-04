use warnings;
use strict;

my $valid = 0;
my @data;
foreach my $j(1..3){
	my $cmd = "cut -f$j input/3.txt";
	push @data, split "\n", `$cmd`;
}

for(my $i = 0; $i < $#data; $i = $i + 3){
	my ($num1, $num2, $num3) = @data[$i..$i+2];
	$valid = $valid + 1 if ($num1 + $num2 > $num3 && $num2 + $num3 > $num1 && $num1 + $num3 > $num2);
}

print "\nNumber of valid triangles: $valid\n";