#!/bin/bash

function GETVAR () {
	if [[ -n "${1}" ]]; then
		NAME="${1}";
	else
		NAME="";
	fi
	if [[ ! "${NAME}" == "" ]]; then
		URL=$(drush "${NAME}" "status" | grep "Site URI" | cut -d: -f2);
	else
		URL=$(drush "status" | grep "Site URI" | cut -d: -f2);
	fi
	URL=$(drush "${NAME}" "status" | grep "Site URI" | cut -d: -f2);
	URL=${URL/  /};
	URL=${URL/ /};
	URL=$(echo $URL | cut -d " " -f1);
	BASEPATH="${PWD}";
}

function GENERATE_REPORT () {
	touch "drupalpages";
	if [[ ! "${NAME}" == "" ]]; then
		drush "${NAME}" "sqlq" "SELECT nid FROM node  WHERE status=1" > "/${BASEPATH}/drupalpages";
	else
		drush "sqlq" "SELECT nid FROM node  WHERE status=1" > "/${BASEPATH}/drupalpages";
	fi
	# # Grab node ids and update access,js
	declare -a pages=($(cat drupalpages));
	OLDpageholder="pagestested";
	resultarray=();
	# clear file
	echo "" > ./checkthesefiles.js
	for x in "${pages[@]}"; do
		resultarray+=("\"http://${URL}/node/${x}\",");
	done
	sed "s|$OLDpageholder|${resultarray[*]}|g" TemplatesTest/access.js >> ./checkthesefiles.js;
	node checkthesefiles.js;
	for X in $(find ./reports/ | grep json); do
		nodenum=${X%.*};
		sed "s|\[|\"node_$nodenum\": \[|" "${X}" > "${X}";
		sed "s|}\]|}\],|g" "${X}" > "${X}";
	done
	echo "" > accessibility_report.json;
	for X in $(find ./reports/ | grep json); do
		if [[ $(cat "$X") != "[]" ]];
			then
			cat "${X}" >> accessibility_report.json;
		fi
	done
	sed -i -e "s|.$|}|" accessibility_report.json;
	sed -i -e "1s|^|\{\n|" accessibility_report.json;
	js-beautify accessibility_report.json > accessibility_report.json;
}

function CLEAN () {
	# REMOVE FILES
	# rm -f reports/*;
	# rm -f drupalpages;
	# rm checkthesefiles.js;
	rm -f *.json-e;
	rm -f reports/*.json-e;
}

if [[ -n "${1}" ]] && [[ -n "${2}" ]]; then
	GETVAR "${1}" "${2}";
elif [[ -n "${1}" ]]; then
	GETVAR "${1}";
elif [[ -z "${1}" ]]; then
	GETVAR;
fi
GENERATE_REPORT;
CLEAN;
