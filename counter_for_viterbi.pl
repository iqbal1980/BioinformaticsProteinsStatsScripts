use Data::Dumper;

open FILE_IN, "<", "out2.txt" or die $!;
open FILE_IN_FASTA, "<", "fasta.txt" or die $!; 
open FILE_IN_DISORDER_SS, "<", "combined_ss_disorder.txt" or die $!; 
open FILE_IN_STATES, "<" ,"out_aa_states.txt" or die $!;
 

sub countOccurencesForStates {
	$combination = shift;
	
	seek FILE_IN_DISORDER_SS,0,0;
	$counter = 0;
	while (<FILE_IN_DISORDER_SS>) {

		$regex=  "(?=($combination))";
		$string = $_;
		my @matches = ($string =~ /$regex/g);
		$length = scalar @matches;
		$counter += $length;

		
	}
	print "Occurences for $combination = $counter\n";
} 
 
sub countOccurences {
	$combination = shift;
	
	seek FILE_IN_FASTA,0,0;
	$counter = 0;
	while (<FILE_IN_FASTA>) {

		$regex=  "(?=($combination))";
		$string = $_;
		my @matches = ($string =~ /$regex/g);
		$length = scalar @matches;
		$counter += $length;

		
	}
	print "Occurences for $combination = $counter\n";
}


print "NOW PROCESSING AMINO ACIDS========================================================================\n";
$all="[A-Z@#]{2}";
countOccurences($all);
while (<FILE_IN>) {
	my $combination =  $_;
	$combination =~ s/\n|\r//;
	print $combination."\n";
	print $combination;
	countOccurences($combination);	
}


print "NOW PROCESSING STATES========================================================================\n";
$all2="[\!HBEGITS\~@#]{2}";
countOccurencesForStates($all2);
while (<FILE_IN_STATES>) {
	my $combination =  $_;
	$combination =~ s/\n|\r//;
	print $combination."\n";
	print $combination;
	countOccurencesForStates($combination);	
}





close FILE_IN;
close FILE_IN_FASTA;
close FILE_IN_DISORDER_SS;
close FILE_IN_STATES;

