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
	rm -f accessibility_report.*;
	touch "drupalpages";
	mkdir -p "${BASEPATH}/reports";
	if [[ ! "${NAME}" == "" ]]; then
		drush "${NAME}" "sqlq" "SELECT nid FROM node  WHERE status=1" > "/${BASEPATH}/drupalpages";
	else
		drush "sqlq" "SELECT nid FROM node  WHERE status=1" > "/${BASEPATH}/drupalpages";
	fi
	# Grab node ids and update access,js
	declare -a pages=($(cat drupalpages));
	OLDpageholder="pagestested";
	resultarray=();
	# clear file
	echo "" > ./checkthesefiles.js;
	echo "" > accessibility_report.json;
	for x in "${pages[@]}"; do
		resultarray+=("\"http://${URL}/node/${x}\",");
	done
	sed "s|$OLDpageholder|${resultarray[*]}|g" TemplatesTest/access.js >> ./checkthesefiles.js;
	node checkthesefiles.js;
	for X in $(find ./reports/* | grep json); do
		X=${X/.\/reports\//};
		X=${X/.json/};
		# echo "${X}";
		nodenum=${X%.*};
		sed -Ei "" 's|\[\{|\{'\"node_$nodenum\"': \[\{|' "./reports/${X}.json";
		echo "}" >> "./reports/${X}.json";
		data=$(cat "./reports/${X}.json");
		# echo "${data}," > "./reports/${X}.json";
		js-beautify -rqf "./reports/${X}.json";
	done
	for X in "${pages[@]}"; do
		jq -s add "${BASEPATH}/reports/${X}.json" "${BASEPATH}/accessibility_report.json" >> "${BASEPATH}/accessibility_report.json";
	done
	# sed -Ei "" 's|.$|}|' "${BASEPATH}/accessibility_report.json";
	# sed -Ei "" '1s|^|\{\n|' "${BASEPATH}/accessibility_report.json";
	sed -Ei "" 's|\}\]\[\{|\}\,\{|g' "${BASEPATH}/accessibility_report.json";
	sed -Ei "" 's|\}\ \{|\}\,\{|g' "${BASEPATH}/accessibility_report.json";
	data=$(cat "${BASEPATH}/accessibility_report.json");
	echo "{${data}}" > "${BASEPATH}/accessibility_report.json";
	js-beautify -rqf "${BASEPATH}/accessibility_report.json";
}

function CLEAN () {
	# REMOVE FILES
	# rm -f reports/*;
	rm -f drupalpages;
	rm checkthesefiles.*;
	# rm -rf ./reports/;
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
