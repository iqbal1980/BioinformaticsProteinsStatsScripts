use Search::Tokenizer;
use List::Util qw(max);
use Data::Dumper;

#Missing ,"fasta_details.txt",
#"missing_details.txt",
my @ssFiles = ("missing_details.txt",
				"b_details.txt"
				,"i_details.txt"
				,"disorder_details.txt"
				,"g_details.txt"
				,"s_details.txt"
				,"e_details.txt"
				,"h_details.txt"
				,"t_details.txt");



my $test2 = "ELLFNKTKSVEFTFGNDTVVIPCFVTNMEAQNTTEVYVKWKFKGRDIYTFDGALNKSTVPTDFSSAKIEVSQLLKGDASLKMDKSDAVSHTGNYTCEVTELTREGETIIELKYRVVSWSTRHHHHHH";

my $structureString = "";

sub arrayHasDuplicates {
	print "here *********************************";
	@inputArray = @{$_[0]};
	
	my $frequencyCounter = 0;
	foreach my $string (@inputArray) {
		if($string == @inputArray[0]) {
			$frequencyCounter++;
		}
		
		if($frequencyCounter > 1) {
			return 1;
		}
	}
	
	return 0;
}


my @test = (255,0,0,0,21,23,1,1,1,12,2);

print ".........................>>>".(arrayHasDuplicates(\@test))."\n";


sub countOccurences {
	my %count;
	my $file = shift;
	my $word = shift;
	my $number = 0;
	open my $fh, '<', $file or die "Could not open '$file' $!";
	while (my $line = <$fh>) {
		#chomp $line;str
		$number += () = $line =~ /$word/gi;
	}
	return $number;
}

%countToType = {};
$initialWindowSize = 2;
$windowSize = $initialWindowSize;


sub recursiveAlgorithm  {
	my $sequence = shift;
	my $numberOfChars = shift;
	
	$subSequence = substr($sequence, 0, $numberOfChars);
	print "$subSequence\n";
	
	foreach $fileName (@ssFiles) {
		my $x= countOccurences($fileName,$subSequence);
		$str = "===$fileName=====$subSequence======>$x\n";
		print "$str\n";
		
		if($fileName =~ /missing_details/) {
			$countToType{"?"} = $x;
		}
		
		if($fileName =~ /disorder_details/) {
			$countToType{"X"} = $x;
		}
		
		if($fileName =~ /b_details/) {
			$countToType{"B"} = $x;
		}
		if($fileName =~ /i_details/) {
			$countToType{"I"} = $x;
		}
		if($fileName =~ /g_details/) {
			$countToType{"G"} = $x;
		}
		if($fileName =~ /s_details/) {
			$countToType{"S"} = $x;
		}
		if($fileName =~ /e_details/) {
			$countToType{"E"} = $x;
		}
		if($fileName =~ /h_details/) {
			$countToType{"H"} = $x;
		}
		if($fileName =~ /t_details/) {
			$countToType{"T"} = $x;
		}	
	}	
	
	my $total = 0;
		
	foreach my $count (sort values %countToType) {
		$total += $count;
		print "$total\n";
	}
		
	@values =  sort {$b <=> $a} values %countToType;
	my $max = $values[0];
	
	#print (Dumper(\%countToType))."\n";
	#print "MAXXXXXX==================$max\n";
	#print (Dumper(\@values))."\n";
	
	my $max = max(values %countToType);
	my %hash_max = map { $countToType{$_}==$max ? ($_, $max) : () } keys %countToType;
	print "max hash ===".(Dumper(\%hash_max))."\n";
	print @maxKey = keys %hash_max;
	print "max hash key ===".(Dumper($maxKey[0]))."\n";
	
	if((length $sequence) > 0) {
		if($total == 0 || arrayHasDuplicates(\@values) == 1) {
			$windowSize--;
			print "calling recursive algorithm again==============windowSize=$windowSize====================================================\n";
			recursiveAlgorithm($sequence,$windowSize);
		} else {
			$sequence =~ s/$subSequence//;
			
			for($i=0;$i<$windowSize;$i++) {
				print "#1";
				$structureString.=$maxKey[0];
			}
			print "windowsSize=$windowSize | structureString=$structureString\n";
			
			$windowSize = $initialWindowSize;
			recursiveAlgorithm($sequence,$windowSize);
		}
	}


}
 
 
 

   

recursiveAlgorithm($test2,$windowSize);


$structureString.= "\n";
print "Final Structure--->".$structureString;	