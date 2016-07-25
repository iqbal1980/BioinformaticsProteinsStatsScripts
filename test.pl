use Data::Dumper;

open FILE_GLOBAL, "<", "viterbi_details.txt" or die $!;
open RESULTS, ">" ,"counter_aa_structures_transitions_results.txt" or die $!;
#open FILE_TRANSITION_REGEXES, "<", "transitions_regexes.txt" or die $!;

$all = "(?=((?<aminoAcid>[XACDEFGHIKLMNPQRSTVWYBZ]{1})#[^#]#=>[^#]#(?<structureType>[^@#]{1})#))";

@allTransitionsRegexes = (
 

		 "(?=([^#]#(?<structureType>S)#=>(?<aminoAcid>V)#[^#]#))"
		 
		 
		 );
		 
		 







		 
		 
		 
 
sub countOccurencesForTransitions {
	$combination = shift;
	
	seek FILE_GLOBAL,0,0;
	$counter = 0;
	while (<FILE_GLOBAL>) {

		$regex=  $combination;
		$string = $_;
		my @matches = ($string =~ /$regex/g);

		
		if(@matches) {
			$length = scalar @matches;
			$length = $length/3;
			$counter += $length;
		}


		#if(@matches) {
		#	print "matches===============>\n";
		#	print Dumper(\@matches);
		#	print "\n";
		#	print "length==>$length\n";
		#	print "matches===============>\n";
		#}
	}
	print " Occurences for $combination = $counter\n";
	print RESULTS " Occurences for $combination = $counter\n";
	return $counter;
} 


print "NOW PROCESSING AMINO ACIDS TO STATES TRANSITIONS========================================================================\n";
print RESULTS "NOW PROCESSING AMINO ACIDS TO STATES TRANSITIONS========================================================================\n";

my $allCount = countOccurencesForTransitions($all);	
print "probability ====>".($allCount/$allCount)."\n";

foreach (@allTransitionsRegexes) {
	my $combination =  $_;
	$combination =~ s/(\n|\r)//g;

	print $combination;
	print RESULTS $combination;
	my $currentCount = countOccurencesForTransitions($combination);	
	print "probability ====>".($currentCount/$allCount)."\n";
	print RESULTS "probability ====>".($currentCount/$allCount)."\n";
	#die;
}


close FILE_GLOBAL;
close RESULTS;
#close FILE_TRANSITION_REGEXES;