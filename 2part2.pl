#! perl

use strict;
use warnings;

my $file = "input/2.txt";

open (my $fh, '<', $file) or die "Cant open file $!";

my @instructions = <$fh>;
chomp(@instructions);
close $fh;

#             0,2                   1
#      -1,1   0,1   1,1           2 3 4
#-2,0  -1,0   0,0   1,0  2,0    5 6 7 8 9
#      -1,-1  0,-1  1,-1          A B C
#             0,-2                  D


my $x = -2;
my $y = 0;
my %map = ("02"  => "1", "-1-1"  => "2", "01" => "3", "11"  => "4",
  "-20"  => "5", "-10"  => "6", "00"  => "7", "10"  => "8","20"  => "9",
  "-1-1"  => "A", "0-1"  => "B", "1-1"  => "C","0-2"  => "D",
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

    if( abs($tempx) < 2 && abs($tempy) < 2 || abs($tempx) == 2 && $tempy == 0 || abs($tempy) == 2 && $tempx == 0){
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

# answer 9A7DC