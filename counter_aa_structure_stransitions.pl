use Data::Dumper;

open FILE_GLOBAL, "<", "viterbi_details.txt" or die $!;
open RESULTS, ">" ,"counter_aa_structures_transitions_results.txt" or die $!;
#open FILE_TRANSITION_REGEXES, "<", "transitions_regexes.txt" or die $!;

$all = "(?=((?<aminoAcid>.{1})#[^#]#=>[^#]#(?<structureType>.{1})#))";

@allTransitionsRegexes = (
		 "(?=((?<aminoAcid>@)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>X)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>A)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>C)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>D)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>E)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>F)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>G)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>H)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>I)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>K)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>L)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>M)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>N)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>P)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>Q)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>R)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>S)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>T)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>V)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>W)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>Y)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>B)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>Z)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 "(?=((?<aminoAcid>#)#[^#]#=>[^#]#(?<structureType>\!)#))",
		 
		 
		 "(?=((?<aminoAcid>@)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>X)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>A)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>C)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>D)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>E)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>F)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>G)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>H)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>I)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>K)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>L)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>M)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>N)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>P)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>Q)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>R)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>S)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>T)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>V)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>W)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>Y)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>B)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>Z)#[^#]#=>[^#]#(?<structureType>H)#))",
		 "(?=((?<aminoAcid>#)#[^#]#=>[^#]#(?<structureType>H)#))",

		 "(?=((?<aminoAcid>@)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>X)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>A)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>C)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>D)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>E)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>F)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>G)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>H)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>I)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>K)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>L)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>M)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>N)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>P)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>Q)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>R)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>S)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>T)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>V)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>W)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>Y)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>B)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>Z)#[^#]#=>[^#]#(?<structureType>B)#))",
		 "(?=((?<aminoAcid>#)#[^#]#=>[^#]#(?<structureType>B)#))",


		 "(?=((?<aminoAcid>@)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>X)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>A)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>C)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>D)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>E)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>F)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>G)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>H)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>I)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>K)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>L)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>M)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>N)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>P)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>Q)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>R)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>S)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>T)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>V)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>W)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>Y)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>B)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>Z)#[^#]#=>[^#]#(?<structureType>E)#))",
		 "(?=((?<aminoAcid>#)#[^#]#=>[^#]#(?<structureType>E)#))",


		 "(?=((?<aminoAcid>@)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>X)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>A)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>C)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>D)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>E)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>F)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>G)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>H)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>I)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>K)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>L)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>M)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>N)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>P)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>Q)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>R)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>S)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>T)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>V)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>W)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>Y)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>B)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>Z)#[^#]#=>[^#]#(?<structureType>G)#))",
		 "(?=((?<aminoAcid>#)#[^#]#=>[^#]#(?<structureType>G)#))",


		 "(?=((?<aminoAcid>@)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>X)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>A)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>C)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>D)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>E)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>F)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>G)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>H)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>I)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>K)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>L)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>M)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>N)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>P)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>Q)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>R)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>S)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>T)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>V)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>W)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>Y)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>B)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>Z)#[^#]#=>[^#]#(?<structureType>I)#))",
		 "(?=((?<aminoAcid>#)#[^#]#=>[^#]#(?<structureType>I)#))",


		 "(?=((?<aminoAcid>@)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>X)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>A)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>C)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>D)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>E)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>F)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>G)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>H)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>I)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>K)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>L)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>M)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>N)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>P)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>Q)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>R)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>S)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>T)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>V)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>W)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>Y)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>B)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>Z)#[^#]#=>[^#]#(?<structureType>T)#))",
		 "(?=((?<aminoAcid>#)#[^#]#=>[^#]#(?<structureType>T)#))",


		 "(?=((?<aminoAcid>@)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>X)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>A)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>C)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>D)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>E)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>F)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>G)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>H)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>I)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>K)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>L)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>M)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>N)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>P)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>Q)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>R)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>S)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>T)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>V)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>W)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>Y)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>B)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>Z)#[^#]#=>[^#]#(?<structureType>S)#))",
		 "(?=((?<aminoAcid>#)#[^#]#=>[^#]#(?<structureType>S)#))",


		 "(?=((?<aminoAcid>@)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>X)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>A)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>C)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>D)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>E)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>F)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>G)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>H)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>I)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>K)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>L)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>M)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>N)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>P)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>Q)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>R)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>S)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>T)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>V)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>W)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>Y)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>B)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>Z)#[^#]#=>[^#]#(?<structureType>\~)#))",
		 "(?=((?<aminoAcid>#)#[^#]#=>[^#]#(?<structureType>\~)#))",


		 "(?=((?<aminoAcid>@)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>X)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>A)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>C)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>D)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>E)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>F)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>G)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>H)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>I)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>K)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>L)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>M)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>N)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>P)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>Q)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>R)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>S)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>T)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>V)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>W)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>Y)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>B)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>Z)#[^#]#=>[^#]#(?<structureType>@)#))",
		 "(?=((?<aminoAcid>#)#[^#]#=>[^#]#(?<structureType>@)#))",


		 "(?=((?<aminoAcid>@)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>X)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>A)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>C)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>D)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>E)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>F)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>G)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>H)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>I)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>K)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>L)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>M)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>N)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>P)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>Q)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>R)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>S)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>T)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>V)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>W)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>Y)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>B)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>Z)#[^#]#=>[^#]#(?<structureType>#)#))",
		 "(?=((?<aminoAcid>#)#[^#]#=>[^#]#(?<structureType>#)#))"

		 );
		 
		 







		 
		 
		 
		 
sub countOccurencesForTransitions {
	$combination = shift;
	
	seek FILE_GLOBAL,0,0;
	$counter = 0;
	while (<FILE_GLOBAL>) {

		$regex=  $combination;
		$string = $_;
		my @matches = ($string =~ /$regex/);
		$length = scalar @matches;
		$counter += $length;

		
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