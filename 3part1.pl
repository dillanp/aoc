use warnings;
use strict;

my $file = "input/3.txt";

open (my $fh, '<', $file) or die "Cant open file $!";
my $valid = 0;
while (my $row = <$fh>) {
	chomp($row);
	my ($num1, $num2, $num3) = split('\t', $row);
	$valid = $valid + 1 if ($num1 + $num2 > $num3 && $num2 + $num3 > $num1 && $num1 + $num3 > $num2);
}
close $fh;
print "\nNumber of valid triangles: $valid\n";