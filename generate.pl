use Algorithm::Combinatorics qw(variations_with_repetition);

open FILE_OUT_1, ">", "out1.txt" or die $!;
open FILE_OUT_2, ">", "out2.txt" or die $!;
open FILE_OUT_STATES, ">", "out_aa_states.txt" or die $!;
#open FILE_OUT_3, ">", "out3.txt" or die $!;
#open FILE_OUT_4, ">", "out4.txt" or die $!;
#open FILE_OUT_5, ">", "out5.txt" or die $!;


#my @numberToAA = split("","\^ACDEFGHIKLMNPQRSTVWYBZ\$");
#my @numberToAA = split("","ACDEFGHIKLMNPQRSTVWYBZ");
my @numberToAA = split(",","@,X,A,C,D,E,F,G,H,I,K,L,M,N,P,Q,R,S,T,V,W,Y,B,Z,#");
my @numberToStates = split("","!HBEGITS~");

my $p_iterator_1 = variations_with_repetition(\@numberToAA,1);
print "1\n";
while (my $p = $p_iterator_1->next) {
     $row = join("",@{$p});
	 print FILE_OUT_1 "$row\n";
}

my $p_iterator_2 = variations_with_repetition(\@numberToAA,2);
print "2\n";
while (my $p = $p_iterator_2->next) {
     $row = join("",@{$p});
	 print FILE_OUT_2 "$row\n";
}


my $states_iterator_2 = variations_with_repetition(\@numberToStates,2);
print "3\n";
while (my $p = $states_iterator_2->next) {
     $row = join("",@{$p});
	 print FILE_OUT_STATES "$row\n";
}



#my $p_iterator_3 = variations_with_repetition(\@numberToAA,3);
#print "3\n";
#while (my $p = $p_iterator_3->next) {
#     $row = join("",@{$p});
#	 print FILE_OUT_3 "$row\n";
#}

#my $p_iterator_4 = variations_with_repetition(\@numberToAA,4);
#print "4\n";
#while (my $p = $p_iterator_4->next) {
#     $row = join("",@{$p});
#	 print FILE_OUT_4 "$row\n";
#}

#my $p_iterator_5 = variations_with_repetition(\@numberToAA,5);
#print "5\n";
#while (my $p = $p_iterator_5->next) {
#     $row = join("",@{$p});
#	 print FILE_OUT_5 "$row\n";
#}


close FILE_OUT_1;
close FILE_OUT_2;
close FILE_OUT_STATES;
#close FILE_OUT_3;
#close FILE_OUT_4;
#close FILE_OUT_5;

 
