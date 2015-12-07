# !/bin/bash
echo "What is the name of the site you want to check?"
read NAME
echo "You have selected $NAME"
cd /acquia/sites/$NAME/$NAME.loc.gbuild.net.latest/sites/all/themes/custom/$NAME_theme
drush sqlq "SELECT nid FROM node  WHERE status=1" --result-file=/acquia/tests/accessibility/drupalpages



# # Grab node ids and update access,js
cd /acquia/tests/accessibility
declare -a pages=($(cat drupalpages));
OLDpageholder="pagestested";
resultarray=();
# clear file
echo "" > ./checkthesefiles.js
for x in "${pages[@]}";
do resultarray+=("\"http://whatsnext.loc.gbuild.net/node/${x}\",");
done
sed "s|$OLDpageholder|${resultarray[*]}|g" TemplatesTest/access.js >> ./checkthesefiles.js;

node checkthesefiles.js;

for X in $(ls ./reports/); do 
nodenum=${X%.*};
sed -i "s|\[|\"nodenumber $nodenum\"\[|" ./reports/${X};

sed -i -e "s|}\]|}\]\],|g" ./reports/${X};
# sed -i -e "s|\]||g" ./reports/${X};
# sed -i -e "s|\[||g" ./reports/${X};
echo "${X}";

done


# # # # # Grab WCAG array items and update grunt file
# # declare -a TESTS=('WCAG2A' 'WCAG2AA' 'WCAG2AAA')
# # OLD="testaa";
# # resultarray2=();
# # for xx in "${TESTS[@]}";
# # do resultarray2+=("\"$xx\",");
# # done

# # cd /acquia/tests/accessibility
# # sed -i "s|$OLD|${resultarray2[*]}|g" ./Gruntfile.js;




echo "" > accessibility_report.json;
for X in $(ls ./reports/); do 

if [[ $(cat ./reports/"$X") != "[]" ]];
	then
	cat "./reports/${X}" >> accessibility_report.json;
fi
done


sed -i -e "1i{" accessibility_report.json; # prepend [ character
sed -i -e "$ s/.$/}/" accessibility_report.json;
	
# 	sed -i "1s|^|{\"SITENAME\"\:\[|" accessibility_report.json;
# 	sed -i -e "\$a\]}" accessibility_report.json;
# 	sed -i -e '{:q;N;s/\n/ /g;t q}' accessibility_report.json;
# 	sed -i -e "s|, \]|\]|" accessibility_report.json;



# 	sed -i -e '{:q;N;s/\n/ /g;t q}' accessibility_report.json;
# 	sed -i -e "s|, \]|\]|" accessibility_report.json;



# REMOVE FILES
# rm reports/*.json
rm checkthesefiles.js

# 	grunt;
# 	cat "./reports/test.${EXT}" > "./reports/${DATE}-${TEST}.${EXT}";
# 	if [[ ! $(cat "./reports/${DATE}-${TEST}.${EXT}") == "[]" ]]; then ERRORS=true; fi
# 	rm "./reports/test.${EXT}";
# 	rm ./Gruntfile.js;

# cat ./reports/*.json > ./reports/${DATE}WebChecklist;

# if [[ "${ERRORS}" == true ]]; then
# 	echo "Errors were found!";
# else
# 	echo "Errors were not found!";
# fi