#! perl

use strict;
use warnings;

my $file = "input/4.txt";
open (my $fh, '<', $file) or die "Cant open file $!";
my @rooms = <$fh>;
chomp(@rooms);
close $fh;

foreach my $room (@rooms){
	my ($letters, $sectorid, $checksum) = $room =~ m/([a-z|-]+)(\d+)\[(.*)\]/;
	my $shift = $sectorid % 26; 
	my $replace = chr(97+$shift)."-za-".chr(96+$shift);
	#ASCII 97 is 'a'. If shift is 5 then replace = (97+shift)-z & a-(97+shift-1) = f-za-e. 
	#Have to eval sinc tr doesn't support variable interpolation...this took me way too long to figure out >:|
	print "$letters ";
	eval "\$letters =~ tr/a-z/$replace/";
	print "$letters $replace $shift\n";
	die "$letters $sectorid\n" if ($letters =~ /north/);
}