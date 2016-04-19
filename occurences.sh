
echo $1

echo 'fasta==>'
grep -o $1 fasta.txt | wc -l
echo ''

echo 'disorder==>'
grep -o $1 disorder_details.txt | wc -l
echo ''

echo 'h_details==>'
grep -o $1 h_details.txt | wc -l
echo ''

echo 'b_details==>'
grep -o $1 b_details.txt | wc -l
echo ''

echo 'e_details==>'
grep -o $1 e_details.txt | wc -l
echo ''

echo 'g_details==>'
grep -o $1 g_details.txt | wc -l
echo ''

echo 'i_details==>'
grep -o $1 i_details.txt | wc -l
echo ''

echo 't_details==>'
grep -o $1 t_details.txt | wc -l
echo ''

echo 's_details==>'
grep -o $1 s_details.txt | wc -l
echo ''



