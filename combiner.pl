use Search::Tokenizer;
use Data::Dumper;


sub combineChars {
	my $c1 = shift;
	my $c3 = shift;
	my $aa = $c2;
			
	my $structure = $c3;
	if($c1 eq "!" && $c3 eq "~") {
		$structure = "!";
	}
			
	if($structure =~ /(\r|\n| |\t)+/m) {
		$structure="";
	}

	return $structure;		


}

sub combineStrings  {
	my $w1 = shift;
	my $w3 = shift;
	
	my @w1List = split("",$w1);
	my @w3List = split("",$w3);
	
	#print Dumper(\@w1List);
	my $arr1Size = @w1List;
	my $arr3Size = @w3List;
	
	my $returned = "";
	for($i=0;$i<$arr1Size;$i++) {
		$returned .= combineChars($w1List[$i],$w3List[$i])
	}
	
	return "".$returned."\n";
	

	
}
   

open FILE_DIS,   "<", "disorder.txt" or die $!;
open FILE_SEC, "<", "secondarystructure.txt" or die $!;


open FILE_VITERBI_DETAILS, ">", "combined_ss_disorder.txt" or die $!;


$i = 0;
while (my $w1 = <FILE_DIS> and my $w3 = <FILE_SEC>) {

	
	$i++;
	#$w1 =~ s/^(.*)===========//;
	#$w3 =~ s/^(.*)===========//;
	print "\n\n\n\n\n".(combineStrings($w1,$w3))."\n\n\n\n\n";	
	
	#die;
}
