perl splitssdfiles.pl
perl generate.pl
perl tokenizer.pl#ignore
perl generate2.pl#ignore
perl combiner.pl
perl tokenizer_for_viterbi.pl #> viterbi_source.out
#perl counter_aa_structure_stransitions.pl
perl counter_states_structures_to_aa_transitions.pl > final_out.txt
perl counter_for_viterbi.pl
./globalcounter.sh
