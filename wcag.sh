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
	REPORTNAME="accessibility_report";
	OUTPUT="${BASEPATH}/${REPORTNAME}.json";
}

function GENERATE_REPORT () {
	touch "drupalpages";
	mkdir -p "${BASEPATH}/reports";
	if [[ ! "${NAME}" == "" ]]; then
		drush "${NAME}" "sqlq" "SELECT nid FROM node  WHERE status=1" > "/${BASEPATH}/drupalpages";
	else
		drush "sqlq" "SELECT nid FROM node  WHERE status=1" > "/${BASEPATH}/drupalpages";
	fi
	# Grab node ids and update access,js
	# declare -a pages=($(cat drupalpages));
	declare -a pages=("1" "3");
	OLDpageholder="pagestested";
	resultarray=();
	# clear file
	echo "" > ./checkthesefiles.js;
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
		js-beautify -rqf "./reports/${X}.json";
	done
	for X in "${pages[@]}"; do
		if [[ ! -a "${OUTPUT}" ]]; then
			cp "./reports/${X}.json" "${OUTPUT}";
		else
			jq -s add "${BASEPATH}/reports/${X}.json" "${OUTPUT}" >> "${OUTPUT}";
		fi
	done
	js-beautify -rqf "${OUTPUT}";
	sed -Ei "" 's|}]|}],|g' "${OUTPUT}";
	sed -Ei "" 's|}],,|}],|g' "${OUTPUT}";
	sed -Ei "" 's|} {||g' "${OUTPUT}";
	js-beautify -rqf "${OUTPUT}";
	sed -Ei "" '$ d' "${OUTPUT}";
	sed -Ei "" '$ d' "${OUTPUT}";
	echo "}]}" >> "${OUTPUT}";
	js-beautify -rqf "${OUTPUT}";
}

function CLEAN () {
	# REMOVE FILES
	rm -f "${OUTPUT}";
	rm -f reports/*;
	rm -rf ./reports/;
	rm -f drupalpages;
	rm checkthesefiles.*;
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
