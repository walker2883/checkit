# !/bin/bash
#go to the root path of the drupal install and query database for all nodes ids. 
#Place ids into a document
rootpath=$(drush drupal-directory '%root');
mkdir -p $rootpath/checkit/accessibility;
drush sqlq "SELECT nid FROM node  WHERE status=1" --result-file=$rootpath/checkit/accessibility/drupalpages;



echo "Enter the site url path"
read sitepathurl
echo "You have selected $sitepathurl"


# # Grab node ids and update access,js
cd $rootpath/checkit/accessibility
declare -a pages=($(cat drupalpages));
OLDpageholder="pagestested";
resultarray=();
# clear file
echo "" > ./checkthesefiles.js;
chmod 777 ./checkthesefiles.js;
for x in "${pages[@]}";
do resultarray+=("\"$sitepathurl/node/${x}\",");
done
sed "s|$OLDpageholder|${resultarray[*]}|g" $rootpath/checkit/TemplatesTest/access.js >> ./checkthesefiles.js;

node checkthesefiles.js;




# PUT NODE NUMBER INTO EACH JSON FILE -  /node/1

for X in $(ls ./reports/); do 
nodenum=${X%.*};
sed -i "s|\[|\"$sitepathurl\/$nodenum\"\:\[|" ./reports/${X};
sed -i -e "s|}\]|}\]},|g" ./reports/${X};
sed -i "1s|^|{|g" ./reports/${X};

echo "${X}";

cat "./reports/${X}" >> merging.json;

done



#http://checkit-walker2883.c9users.io

echo "" > accessibility_report.json;



for X in $(ls ./reports/); do 
	
	cat "./reports/${X}" >> accessibility_report.json;
done

#validate json by adding additional characters
sed -i "1s|^|\[|g" ./accessibility_report.json;
sed -i 's|$|ENDOTEXT|g' ./accessibility_report.json;
sed -i 's|,ENDOTEXT|\]|g' ./accessibility_report.json;
sed -i 's|\[ENDOTEXT|\[|g' ./accessibility_report.json;











