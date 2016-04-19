

open FILE_JSON, ">", "pdb.json" or die $!;
open FILE_FASTA, "<", "fasta.txt" or die $!;
open FILE_SS,    "<", "secondarystructure.txt" or die $!;
open FILE_DIS,   "<", "disorder.txt" or die $!;
	
	
my $current_file_handler;

print FILE_JSON "	[\n";
print "Start ";

my $counter = 0;
my $counter2 = 0;
while (<FILE_FASTA>) {
	if($_ =~ /(===========)/) {
		$counter++;
	}
}

print $counter;

seek FILE_FASTA,0,0;

while ($a = <FILE_FASTA>, $b = <FILE_SS>, $c = <FILE_DIS>) {
	
	if($a =~ /sequence/) {
		$counter2++;
		
		$key = $a;
		$key =~ s/([A-Z0-9]{4}:[A-Za-z]{1})(:)(sequence|disorder|secstr)(===========)(.*)$/$1/g;
		#$key =~ s/:/_/g;
		#$key =~ s/>//g;
		$key =~ s/\n//g;
		$a2 = $a;
		$b2 = $b;
		$c2 = $c;
		
		$a2 =~ s/[A-Z0-9]{4}:[A-Za-z]{1}:(sequence|disorder|secstr)//g;
		$a2 =~ s/===========//g;
		$a2 =~ s/\n//g;
		
		$b2 =~ s/[A-Z0-9]{4}:[A-Za-z]{1}:(sequence|disorder|secstr)//g;
		$b2 =~ s/===========//g;
		$b2 =~ s/\n//g;
		
		$c2 =~ s/[A-Z0-9]{4}:[A-Za-z]{1}:(sequence|disorder|secstr)//g;
		$c2 =~ s/===========//g;
		$c2 =~ s/\n//g;
		
		print FILE_JSON "		{\n";
		print FILE_JSON "			\"$key\" : {\n"; 
		print FILE_JSON "						\"fasta\" : \"$a2\", \n";
		print FILE_JSON "						\"secondaryStructure\" : \"$b2\", \n";
		print FILE_JSON "						\"disorder\" : \"$c2\" \n";
		print FILE_JSON "			}\n"; 
		print FILE_JSON "		}";
		if($counter2 < $counter) {
			print FILE_JSON ",";
		}
		print FILE_JSON "\n";
	}
}


print FILE_JSON "	]\n";


close FILE_IN;
close FILE_FASTA;
close FILE_SS;
close FILE_DIS;