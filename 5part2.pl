#! perl

use strict;
use warnings;
use Digest::MD5 qw(md5_hex);

my $input = "uqwqemis";
print $input;

my @password;
my $integer = 0;
while($#password < 7){
  my $hash = md5_hex("$input$integer");
  if (substr ($hash, 0, 5) eq "00000"){
    my $pos = substr $hash,5,1;
    my $char = substr $hash, 6,1;
    if ($pos =~ /[0-7]/ && ! defined $password[$pos] ){
      $password[$pos] = $char;
    }
  }
  $integer++;
}
print "\nThe Password is: ";
print join "", @password;
