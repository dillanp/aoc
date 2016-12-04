#! perl

use strict;
use warnings;

my $file = "input/4.txt";
open (my $fh, '<', $file) or die "Cant open file $!";
my @rooms = <$fh>;
chomp(@rooms);
close $fh;

my $sum = 0;
foreach my $room (@rooms){
	my %count;
	my ($letters, $sectorid, $checksum) = $room =~ m/([a-z|-]+)(\d+)\[(.*)\]/;
	$letters =~ s/-//g; #remove dashes
	#get count of each letter
	foreach my $char (split //, $letters) {
        $count{$char}++;
    }
    #order by most appearances first, if tie order alphabetically
    my @ordered = sort { $count{$b} <=> $count{$a} || $a cmp $b } keys %count;
	$sum += $sectorid if((join '', @ordered[0..4]) eq $checksum);
}

print "Sum of sector ID's: $sum\n";