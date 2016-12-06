use strict;
use warnings;
use Data::Dumper;

my $file = "input/6.txt";
open( my $fh, '<', $file) or die "Cant open file $!";
my @words = <$fh>;
close $fh;
chomp(@words);
my %chars;
foreach my $word (@words){
    my $count = 0;
    foreach my $c (split //, $word){
        $chars{$count++}{$c}++;
    }
}
print Dumper \%chars;
my ($mostfreq, $leastfreq) = "" x 2;
foreach my $position(sort keys \%chars){
    my @ordered = sort { $chars{$position}{$b} <=> $chars{$position}{$a} } keys $chars{$position};
    print join "", @ordered;
    print "\n";
    $mostfreq .= $ordered[0];
    $leastfreq .= $ordered[-1];

}
print "$mostfreq\n";
print "$leastfreq\n";











