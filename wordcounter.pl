use strict;
use warnings;
 
my %count;
my $file = shift or die "Usage: $0 FILE\n";
my $word = shift;
my $number = 0;
open my $fh, '<', $file or die "Could not open '$file' $!";
while (my $line = <$fh>) {
    #chomp $line;str
    $number += () = $line =~ /$word/gi;
}
 
print "---->".$number;