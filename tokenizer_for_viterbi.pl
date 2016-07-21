use Search::Tokenizer;
use Data::Dumper;


my $test1 = "---------------------XXXXXXXX--------XX-----------------------XXXXXXXXXXX-----------";
my $test2 = "CDEASDASDSDFGFGWEJJELWJRRGJDFLKGJQWSDFJSDLGKJDSGLKSJDGLDSKJGLSDGJDSLKGJSLKGJLSDGJLSJ";

sub combineChars {
	my $c1 = shift;
	my $c2 = shift;
	my $c3 = shift;
	
	
	#if($c1 ne '\n' && $c1 ne '\n' && $c2 ne '\n' && $c2 ne '\n' && $c3 ne '\n' && $c3 ne '\n') {
	#	if($c1 ne '\r' && $c1 ne '\r' && $c2 ne '\r' && $c2 ne '\r' && $c3 ne '\r' && $c3 ne '\r') {
			
			
			#print "$c1 $c2 $c3 \n";
			
			my $aa = $c2;
			
			my $structure = $c3;
			if($c1 eq "!" && $c3 eq "~") {
				$structure = "!";
			}
			
			if($structure =~ /(\r|\n| |\t)+/m) {
				$c2 ="";
				$structure="";
			}
			#print "$c2\[$structure\]->";
			
			if($c2 ne "" && $structure ne "") {
				return $c2.'#'.$structure.'#=>';
			} else {
				return "";
			}
	#	}
	#}

}

sub combineStrings  {
	my $w1 = shift;
	my $w2 = shift;
	my $w3 = shift;
	
	#print "$w1 $w2 $w3\n";
	
	my @w1List = split("",$w1);
	my @w2List = split("",$w2);
	my @w3List = split("",$w3);
	
	#print Dumper(\@w1List);
	my $arr1Size = @w1List;
	my $arr2Size = @w2List;
	my $arr3Size = @w3List;
	
	#print  "arr1Size=$arr1Size\n";
	#print  "arr2Size=$arr2Size\n";
	#print  "arr3Size=$arr3Size\n";
	
	my $returned = "";
	for($i=0;$i<$arr1Size;$i++) {
		$returned .= combineChars($w1List[$i],$w2List[$i],$w3List[$i])
	}
	
	return "START=>".$returned."END\n";
	

	
}
   

#generateTokenInformation("(x|X)+",$test1,$test2);
#generateTokenInformation("[^(x|X)]+",$test1,$test2);
   
open FILE_FASTA, "<", "fasta.txt" or die $!;
open FILE_DIS,   "<", "disorder.txt" or die $!;
open FILE_SEC, "<", "secondarystructure.txt" or die $!;


open FILE_VITERBI_DETAILS, ">", "viterbi_details.txt" or die $!;


$i = 0;
while (my $w1 = <FILE_DIS> and my $w2 = <FILE_FASTA> and my $w3 = <FILE_SEC>) {
	#print $w1."\n";
	#print $w2."\n";
	#print $w3."\n";
	
	$i++;
	$w1 =~ s/^(.*)===========//;
	$w2 =~ s/^(.*)===========//;
	$w3 =~ s/^(.*)===========//;
	#print "\n\n\n\n\n".(combineStrings($w1,$w2,$w3))."\n\n\n\n\n";	
	print FILE_VITERBI_DETAILS "\n\n\n\n\n".(combineStrings($w1,$w2,$w3))."\n\n\n\n\n";
	#die;
}


# Leftover lines in either file?
#print "\n" while <FILE>;
#print "\n" while <FILE2>;