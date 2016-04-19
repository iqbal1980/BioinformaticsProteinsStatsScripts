
#echo $1;
#echo $2;

while read LINE
do
    echo "$LINE===>"`grep -o $LINE $1 | wc -l`
done < $2



