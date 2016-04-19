use Search::Tokenizer;


my $test1 = "---------------------XXXXXXXX--------XX-----------------------XXXXXXXXXXX-----------";
my $test2 = "CDEASDASDSDFGFGWEJJELWJRRGJDFLKGJQWSDFJSDLGKJDSGLKSJDGLDSKJGLSDGJDSLKGJSLKGJLSDGJLSJ";




sub generateTokenInformation  {
	my ($regexPattern, $secondaryStructureInfoOrDisorder, $fastaSequence) = @_;
	
	my $returnedString;
	my $tokenizer = Search::Tokenizer->new(
		 regex     => qr/$regexPattern/,
	);

	my $iterator = $tokenizer->($secondaryStructureInfoOrDisorder);

	$returnedString = "";
	while (my ($term, $len, $start, $end, $index) = $iterator->()) {
		$returnedString .=  $term."|".$len."|".$start."|".$end."|".$index."|";
		$subString = substr $fastaSequence, $start, $len;
		$returnedString .=$subString;
		$returnedString .= "\n";
		#print $returnedString."\n";
	}
	
	return $returnedString."\n";
}
   

#generateTokenInformation("(x|X)+",$test1,$test2);
#generateTokenInformation("[^(x|X)]+",$test1,$test2);
   
open FILE_FASTA, "<", "fasta.txt" or die $!;
open FILE_DIS,   "<", "disorder.txt" or die $!;
open FILE_SEC, "<", "secondarystructure.txt" or die $!;

open FILE_FASTA_DETAILS, ">", "fasta_details.txt" or die $!;
open FILE_DIS_DETAILS,   ">", "disorder_details.txt" or die $!;


open FILE_H_DETAILS, ">", "h_details.txt" or die $!;
open FILE_B_DETAILS, ">", "b_details.txt" or die $!;
open FILE_E_DETAILS, ">", "e_details.txt" or die $!;
open FILE_G_DETAILS, ">", "g_details.txt" or die $!;
open FILE_I_DETAILS, ">", "i_details.txt" or die $!;
open FILE_T_DETAILS, ">", "t_details.txt" or die $!;
open FILE_S_DETAILS, ">", "s_details.txt" or die $!;
open FILE_MISSING_DETAILS, ">", "missing_details.txt" or die $!;

$i = 0;
while (my $w1 = <FILE_DIS> and my $w2 = <FILE_FASTA> and my $w3 = <FILE_SEC>) {
	#print $w1."\n";
	#print $w2."\n";
	#print $w3."\n";
	
	$i++;
	print FILE_DIS_DETAILS "line $i================================================================\n";
	print FILE_DIS_DETAILS generateTokenInformation("(X)+",$w1,$w2);
	print FILE_DIS_DETAILS "line $i================================================================\n\n\n";
	
	print FILE_FASTA_DETAILS "line $i================================================================\n";
	print FILE_FASTA_DETAILS generateTokenInformation("(\-|X)+",$w1,$w2);
	print FILE_FASTA_DETAILS "line $i================================================================\n\n\n";
	
	print FILE_H_DETAILS "line $i================================================================\n";
	print FILE_H_DETAILS generateTokenInformation("(H)+",$w3,$w2);
	print FILE_H_DETAILS "line $i================================================================\n\n\n";
	
	print FILE_B_DETAILS "line $i================================================================\n";
	print FILE_B_DETAILS generateTokenInformation("(B)+",$w3,$w2);
	print FILE_B_DETAILS "line $i================================================================\n\n\n";
	
	print FILE_E_DETAILS "line $i================================================================\n";
	print FILE_E_DETAILS generateTokenInformation("(E)+",$w3,$w2);
	print FILE_E_DETAILS "line $i================================================================\n\n\n";
	
	print FILE_G_DETAILS "line $i================================================================\n";
	print FILE_G_DETAILS generateTokenInformation("(G)+",$w3,$w2);
	print FILE_G_DETAILS "line $i================================================================\n\n\n";
	
	print FILE_I_DETAILS "line $i================================================================\n";
	print FILE_I_DETAILS generateTokenInformation("(I)+",$w3,$w2);
	print FILE_I_DETAILS "line $i================================================================\n\n\n";
	
	print FILE_T_DETAILS "line $i================================================================\n";
	print FILE_T_DETAILS generateTokenInformation("(T)+",$w3,$w2);
	print FILE_T_DETAILS "line $i================================================================\n\n\n";
	
	print FILE_S_DETAILS "line $i================================================================\n";
	print FILE_S_DETAILS generateTokenInformation("(S)+",$w3,$w2);
	print FILE_S_DETAILS "line $i================================================================\n\n\n";
	
	print FILE_MISSING_DETAILS "line $i================================================================\n";
	print FILE_MISSING_DETAILS generateTokenInformation("(~)+",$w3,$w2);
	print FILE_MISSING_DETAILS "line $i================================================================\n\n\n";
	
	
	
}


# Leftover lines in either file?
#print "\n" while <FILE>;
#print "\n" while <FILE2>;