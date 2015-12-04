#!/bin/bash

function GETVAR () {
	# echo "What is the name of the site you want to check?"
	# read NAME
	NAME="ssphelp";
	# echo "Which environment of the site you want to check?"
	# read ENV
	ENV="prod";
	echo "You have selected $NAME"
	BASEPATH="/acquia";
	# BASEPATH="/acquia/20150831123758.loc.gbuild.net";
}

function GENERATE_REPORT () {
	touch "/${BASEPATH}/tests/accessibility/drupalpages";
	drush "@ssc.ace.${NAME}.${ENV}" sqlq "SELECT nid FROM node  WHERE status=1" > "/${BASEPATH}/tests/accessibility/drupalpages";
	# # Grab node ids and update access,js
	cd "${BASEPATH}/tests/accessibility";
	declare -a pages=($(cat drupalpages));
	OLDpageholder="pagestested";
	resultarray=();
	# clear file
	echo "" > ./checkthesefiles.js
	for x in "${pages[@]}"; do
		resultarray+=("\"http://ssc:sdh93d2c7ae@${ENV}-${NAME}.ace.gbuild.net/node/${x}\",");
	done
	sed "s|$OLDpageholder|${resultarray[*]}|g" TemplatesTest/access.js >> ./checkthesefiles.js;
	node checkthesefiles.js;
	for X in $(find ./reports/ | grep json); do
		nodenum=${X%.*};
		sed -i "s|\[|\"node_$nodenum\": \[|" ${X};
		sed -i -e "s|}\]|}\],|g" ${X};
		echo "${X}";
	done
	echo "" > accessibility_report.json;
	for X in $(find ./reports/ | grep json); do
		if [[ $(cat "$X") != "[]" ]];
			then
			cat "${X}" >> accessibility_report.json;
		fi
	done
	sed -i -e "$ s/.$/}/" accessibility_report.json;
	sed -i '1s|^|\{\n|' accessibility_report.json;
	js-beautify accessibility_report.json;
}

# function CLEAN () {
# 	# REMOVE FILES
# 	# rm -f reports/*
# 	# rm -f drupalpages
# 	# rm checkthesefiles.js
# }

GETVAR;
GENERATE_REPORT;
# CLEAN;
