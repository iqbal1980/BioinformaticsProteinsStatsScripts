

open FILE_IN, "<", "ss_dis.txt" or die $!;
open FILE_FASTA, ">", "fasta.txt" or die $!;
open FILE_SS,    ">", "secondarystructure.txt" or die $!;
open FILE_DIS,   ">", "disorder.txt" or die $!;
open FILE_LENGTHS, ">", "lengths.txt" or die $!;
		
	
my $current_file_handler;
	
while (<FILE_IN>) {
	#print $_;
	if($_ =~ /sequence/) {
		$current_file_handler=*FILE_FASTA;
	}

	if($_ =~ /secstr/) {
		$current_file_handler=*FILE_SS;
	}

	if($_ =~ /disorder/) {
		$current_file_handler=*FILE_DIS;
	}	

	$tmp = $_;	
	$tmp =~ s/( )/~/g;
	$tmp =~ s/^(.*)(sequence|disorder|secstr)/lc($1)."$2===========@"/ge;
	$tmp =~ s/(secstr)/secstruc/g;
	$tmp =~ s/\n//g;
	$tmp =~ s/>/#\n/g;
	print $current_file_handler $tmp;
}

close FILE_IN;
close FILE_FASTA;
close FILE_SS;
close FILE_DIS;


open FILE_FASTA2, "<", "fasta.txt" or die $!;
while(<FILE_FASTA2>) {
	#print "$_\n";
	$tmp2 = $_;
	@tmp3 = split  "===========", $tmp2;
	$length = length $tmp3[1];
	
	print FILE_LENGTHS lc($tmp3[0])."===========".$length."\n";
	
}



close FILE_FASTA2;
close FILE_LENGTHS;


$executed = `sed  -i 's/X/!/g' disorder.txt`;





























