#! perl

use strict;
use warnings;

my $file = "input/2.txt";

open (my $fh, '<', $file) or die "Cant open file $!";

my @instructions = <$fh>;
chomp(@instructions);
close $fh;

my $x = 0;
my $y = 0;

#-1,-1  0,1   1,1   1 2 3
#-1,0   0,0   1,0   4 5 6
#-1,-1  0,-1  1,-1  7 8 9

my %map = ("-1-1"  => "1", "01" => "2", "11"  => "3",
  "-10"  => "4", "00"  => "5", "10"  => "6",
  "-1-1"  => "7", "0-1"  => "8", "1-1"  => "9",
);

my @code;

foreach my $instruction(@instructions){
  for my $c (split //, $instruction) {

    my $tempx = $x;
    my $tempy = $y;

    if($c eq 'U') { $tempy++; }
    elsif($c eq 'D') { $tempy--; }
    elsif($c eq 'L') { $tempx--; }
    elsif($c eq 'R') { $tempx++; }
    else{die;}

    if( abs($tempx) < 2 && abs($tempy) < 2){
      $x = $tempx;
      $y = $tempy;
    }

  }

  push @code, "$x$y";

}
print "Code: ";
foreach(@code){
  print $map{$_};
}
print "\n";
