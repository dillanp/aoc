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

my ($mostfreq, $leastfreq) = "" x 2;
foreach my $position(sort keys \%chars){
    my @ordered = sort { $chars{$position}{$b} <=> $chars{$position}{$a} } keys $chars{$position};
    $mostfreq .= $ordered[0];
    $leastfreq .= $ordered[-1];

}
print "Most frequent: $mostfreq\n";
print "Least frequent: $leastfreq\n";











