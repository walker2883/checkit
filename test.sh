
echo > test.json;
declare -a myarray=()

for X in $(ls ./reports/); do 
if [[ $(cat ./reports/"$X") != "[]" ]];
then
 if [[ $(cat ./reports/"$X") != "[]" ]];
     then

    # # get the node id from the file name
    nodenum=${X%.*};
    myarray+="${nodenum}";


 	echo "$nodenum" >> test.json;
 	cat "./reports/${X}" >> test.json;
	sed -i -e "s|node\/$nodenum\n\[|\[node\/$nodenum|g" test.json;



	sed -i -e "s|node\/$nodenu\s|\[$nodenum|g" test.json;



    cat "./reports/${X}" >> accessibility_report.json;






 fi
fi




done


sed -i -e "s|}\]|}\]\,|g" test.json;
sed -i -e "1i[" test.json; # prepend [ character
sed -i -e "$ s/.$/\]/" test.json;


sed -i -e 's/^M/FOO/g' test.json;
sed -i -e '{:q;N;s/\n/ /g;t q}' test.json;

sed -i -e "s|[[:space:]]\[{|\[{|" test.json;
sed -i -e "s|\[[[:space:]][[:space:]]|\[|" test.json;




for i in "${myarray[@]}"
do
echo "$i"

filename="./test.json"

${filename/str*${myarray[i]/working}

done





