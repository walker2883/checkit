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
	BASEPATH="/${PWD}";
	REPORTNAME="accessibility_report";
	OUTPUT="${BASEPATH}/${REPORTNAME}.json";
}

function GENERATE_REPORT () {
	touch "drupalpages";
	mkdir -p "${BASEPATH}/reports";
	if [[ ! "${NAME}" == "" ]]; then
		drush "${NAME}" "sqlq" "SELECT nid FROM node_access WHERE grant_view = '1'" > drupalpages;
	else
		drush "sqlq" "SELECT nid FROM node_access WHERE grant_view = '1'" > drupalpages;
	fi
	declare -a PAGESRAW=($(cat ./drupalpages));
	declare -a PAGES=($(printf '%s\n' "${PAGESRAW[@]}" | uniq | sort --numeric-sort --reverse));
	OLDPAGEHOLDER="pagestested";
	declare -a RESULTARRAY=();
	for x in "${PAGES[@]}"; do
		RESULTARRAY+=("\"http://${URL}/node/${x}\",");
	done
	cp "./TemplatesTest/access.js" "./checkthesefiles.js";
	if [[ $(uname) == "Linux" ]]; then
		sed -Ei 's|\[\]|\['"$(echo ${RESULTARRAY[@]})"'\]|g' "./checkthesefiles.js";
	else
		sed -Ei "" 's|\[\]|\['"$(echo ${RESULTARRAY[@]})"'\]|g' "./checkthesefiles.js";
	fi
	# sed "s|$OLDpageholder|${resultarray[@]}|g" "./TemplatesTest/access.js" > "./checkthesefiles.js";
	node checkthesefiles.js;
	for X in $(find ./reports/* | grep json); do
		X=${X/.\/reports\//};
		X=${X/.json/};
		nodenum=${X%.*};
		if [[ $(uname) == "Linux" ]]; then
			if [[ -a "./reports/${X}.json" ]]; then sed -Ei "s|\[\{|\{\"node_$nodenum\": \[\{\"website\":\"$URL\",|" "./reports/${X}.json"; fi
		else
			if [[ -a "./reports/${X}.json" ]]; then sed -Ei "" "s|\[\{|\{\"node_$nodenum\": \[\{|" "./reports/${X}.json"; fi
		fi
		if [[ -a "./reports/${X}.json" ]]; then echo "}" >> "./reports/${X}.json"; fi
		js-beautify -rqf "./reports/${X}.json";
	done
	echo "{" > "${OUTPUT}";
	for X in "${PAGES[@]}"; do
		if [[ $(uname) == "Linux" ]]; then
			if [[ -a "./reports/${X}.json" ]]; then sed -Ei "1 d" "./reports/${X}.json"; fi
			if [[ -a "./reports/${X}.json" ]]; then sed -Ei "$ d" "./reports/${X}.json"; fi
			if [[ -a "./reports/${X}.json" ]]; then sed -Ei "$ d" "./reports/${X}.json"; fi
		else
			if [[ -a "./reports/${X}.json" ]]; then sed -Ei "" "1 d" "./reports/${X}.json"; fi
			if [[ -a "./reports/${X}.json" ]]; then sed -Ei "" "$ d" "./reports/${X}.json"; fi
			if [[ -a "./reports/${X}.json" ]]; then sed -Ei "" "$ d" "./reports/${X}.json"; fi
		fi
		if [[ -a "./reports/${X}.json" ]]; then echo "}]," >> "./reports/${X}.json"; fi
		if [[ -a "./reports/${X}.json" ]]; then cat "./reports/${X}.json" >> "${OUTPUT}"; fi
	done
	echo "}" >> "${OUTPUT}";
	if [[ $(uname) == "Linux" ]]; then
		sed -Ei "s|}]|}],|g" "${OUTPUT}";
		sed -Ei "s|}],,|}],|g" "${OUTPUT}";
		sed -Ei "$ d" "${OUTPUT}";
		sed -Ei "$ d" "${OUTPUT}";
	else
		sed -Ei "" "s|}]|}],|g" "${OUTPUT}";
		sed -Ei "" "s|}],,|}],|g" "${OUTPUT}";
		sed -Ei "" "$ d" "${OUTPUT}";
		sed -Ei "" "$ d" "${OUTPUT}";
	fi
	echo "}]}" >> "${OUTPUT}";
}

function CLEAN () {
	# REMOVE FILES
	if [[ -a "drupalpages" ]]; then rm -f drupalpages; fi
	if [[ -a "reports/*" ]]; then rm -f reports/*; fi
	if [[ -d "./reports/" ]]; then rm -rf ./reports/; fi
	if [[ -a "checkthesefiles.js" ]]; then rm checkthesefiles.js; fi
}

if [[ -n "${1}" ]]; then
	if [[ -n "${2}" ]]; then
		GETVAR "${1}" "${2}";
	else
		GETVAR "${1}";
	fi
else
	GETVAR;
fi

GENERATE_REPORT;
CLEAN;
