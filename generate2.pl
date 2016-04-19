use Algorithm::Combinatorics qw(variations_with_repetition);
use Data::Dumper;

print "Starting\n";
#my @numberToAA = split("","\^ACDEFGHIKLMNPQRSTVWYBZ\$");


my @numberToAA = split(",","@,X,A,C,D,E,F,G,H,I,K,L,M,N,P,Q,R,S,T,V,W,Y,B,Z,#");


my @p_iterator_1 = variations_with_repetition(\@numberToAA,1);
my @p_iterator_2 = variations_with_repetition(\@numberToAA,2);
#my @p_iterator_3 = variations_with_repetition(\@numberToAA,3);

#print Dumper(\$p_iterator_1);
#my $p_iterator_4 = variations_with_repetition(\@numberToAA,4);
#my $p_iterator_5 = variations_with_repetition(\@numberToAA,5);


my @ssFiles = ("missing_details.txt","b_details.txt","fasta_details.txt","i_details.txt","disorder_details.txt","g_details.txt","s_details.txt","e_details.txt","h_details.txt","t_details.txt");

my %b_details_1 = {};        
my %fasta_details_1 = {};
my %i_details_1 = {};
my %disorder_details_1 = {}; 
my %g_details_1 = {};      
my %s_details_1 = {};
my %e_details_1 = {};         
my %h_details_1 = {};      
my %t_details_1 = {};

my %b_details_2 = {};        
my %fasta_details_2 = {};
my %i_details_2 = {};
my %disorder_details_2 = {}; 
my %g_details_2 = {};      
my %s_details_2 = {};
my %e_details_2 = {};         
my %h_details_2 = {};      
my %t_details_2 = {};

my %b_details_3 = {};        
my %fasta_details_3 = {};
my %i_details_3 = {};
my %disorder_details_3 = {}; 
my %g_details_3 = {};      
my %s_details_3 = {};
my %e_details_3 = {};         
my %h_details_3 = {};      
my %t_details_3 = {};


my %b_details_4 = {};        
my %fasta_details_4 = {};
my %i_details_4 = {};
my %disorder_details_4 = {}; 
my %g_details_4 = {};      
my %s_details_4 = {};
my %e_details_4 = {};         
my %h_details_4 = {};      
my %t_details_4 = {};



sub countOccurences {
	my %count;
	my $file = shift;
	my $word = shift;
	my $combinationNum = shift;
	my $number = 0;
	open my $fh, '<', $file or die "Could not open '$file' $!";
	while (my $line = <$fh>) {
		#chomp $line;str
		$number += () = $line =~ /$word/gi;
		if($file =~ /b_details/) {
			$b_details_1{$word} = $number if($combinationNum == 1);
			$b_details_2{$word} = $number if($combinationNum == 2);
			#$b_details_3{$word} = $number if($combinationNum == 3);
		}
		if($file =~ /fasta_details/) {
			$fasta_details_1{$word} = $number if($combinationNum == 1);
			$fasta_details_2{$word} = $number if($combinationNum == 2);
			#$fasta_details_3{$word} = $number if($combinationNum == 3);
		}
		if($file =~ /i_details/) {
			$i_details_1{$word} = $number if($combinationNum == 1);
			$i_details_2{$word} = $number if($combinationNum == 2);
			#$i_details_3{$word} = $number if($combinationNum == 3);
		}
		if($file =~ /disorder_details/) {
			$disorder_details_1{$word} = $number if($combinationNum == 1);
			$disorder_details_2{$word} = $number if($combinationNum == 2);
			#$disorder_details_3{$word} = $number if($combinationNum == 3);
		}
		if($file =~ /g_details/) {
			$g_details_1{$word} = $number if($combinationNum == 1);
			$g_details_2{$word} = $number if($combinationNum == 2);
			#$g_details_3{$word} = $number if($combinationNum == 3);
		}
		if($file =~ /s_details/) {
			$s_details_1{$word} = $number if($combinationNum == 1);
			$s_details_2{$word} = $number if($combinationNum == 2);
			#$s_details_3{$word} = $number if($combinationNum == 3);
		}
		if($file =~ /e_details/) {
			$e_details_1{$word} = $number if($combinationNum == 1);
			$e_details_2{$word} = $number if($combinationNum == 2);
			#$e_details_3{$word} = $number if($combinationNum == 3);
		}
		if($file =~ /h_details/) {	
			$h_details_1{$word} = $number if($combinationNum == 1);
			$h_details_2{$word} = $number if($combinationNum == 2);
			#$h_details_3{$word} = $number if($combinationNum == 3);
		}
		if($file =~ /t_details/) {
			$t_details_1{$word} = $number if($combinationNum == 1);
			$t_details_2{$word} = $number if($combinationNum == 2);
			#$t_details_3{$word} = $number if($combinationNum == 3);
		}
	}
	 
	return $number;
}

my $i=0;


open FILE_OUT_1, ">", "out_count_1.txt" or die $!;
foreach $fileName (@ssFiles) {
	foreach $p (@p_iterator_1) {
		 $combinationStr = join("",@{$p});
		 $i++;
		 my $x= countOccurences($fileName,$combinationStr,1);
		 $str = "1)===$fileName=====$combinationStr======>$x\n";
		 print $str;
		 print FILE_OUT_1 $str;	
	}
}
close FILE_OUT_1;

open FILE_OUT_2, ">", "out_count_2.txt" or die $!;
foreach $fileName (@ssFiles) {
	foreach $p (@p_iterator_2) {
		 $combinationStr = join("",@{$p});
		 $i++;
		 my $x= countOccurences($fileName,$combinationStr,2);
		 $str = "2)===$fileName=====$combinationStr======>$x\n";
		 print $str;
		 print FILE_OUT_2 $str;	
	}
}
close FILE_OUT_2;

#open FILE_OUT_3, ">", "out_count_3.txt" or die $!;
#foreach $fileName (@ssFiles) {
#	foreach $p (@p_iterator_3) {
#		 $combinationStr = join("",@{$p});
#		 $i++;
#		 my $x= countOccurences($fileName,$combinationStr,3);
#		 $str = "3)===$fileName=====$combinationStr======>$x\n";
#		 
#		 print $str;
#		 print FILE_OUT_3 $str;
#	}
#}
#close FILE_OUT_3;


#print Dumper(\%h_details_2);


