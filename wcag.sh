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
		drush "${NAME}" "sqlq" "SELECT nid FROM node  WHERE status=1" > drupalpages;
	else
		drush "sqlq" "SELECT nid FROM node  WHERE status=1" > drupalpages;
	fi
	declare -a PAGESRAW=($(cat ./drupalpages));
	readarray -t PAGES < <(printf '%s\n' "${PAGESRAW[@]}" | sort --numeric-sort --reverse)
	OLDPAGEHOLDER="pagestested";
	declare -a RESULTARRAY=();
	for x in "${PAGES[@]}"; do
		RESULTARRAY+=("\"http://${URL}/node/${x}\",");
	done
	cp "./TemplatesTest/access.js" "./checkthesefiles.js";
	sed -Ei 's|\[\]|\['"$(echo ${RESULTARRAY[@]})"'\]|g' "./checkthesefiles.js";
	# sed "s|$OLDpageholder|${resultarray[@]}|g" "./TemplatesTest/access.js" > "./checkthesefiles.js";
	node checkthesefiles.js;
	for X in $(find ./reports/* | grep json); do
		X=${X/.\/reports\//};
		X=${X/.json/};
		nodenum=${X%.*};
		if [[ $(uname) == "Linux" ]]; then
			sed -Ei "s|\[\{|\{\"node_$nodenum\": \[\{\"website\":\"$URL\",|" "./reports/${X}.json";
		else
			sed -Ei "" "s|\[\{|\{\"node_$nodenum\": \[\{|" "./reports/${X}.json";
		fi
		echo "}" >> "./reports/${X}.json";
		js-beautify -rqf "./reports/${X}.json";
	done
	echo "{" > "${OUTPUT}";
	for X in "${PAGES[@]}"; do
		if [[ $(uname) == "Linux" ]]; then
			sed -Ei "1 d" "./reports/${X}.json";
			sed -Ei "$ d" "./reports/${X}.json";
			sed -Ei "$ d" "./reports/${X}.json";
		else
			sed -Ei "" "1 d" "./reports/${X}.json";
			sed -Ei "" "$ d" "./reports/${X}.json";
			sed -Ei "" "$ d" "./reports/${X}.json";
		fi
		echo "}]," >> "./reports/${X}.json";
		cat "./reports/${X}.json" >> "${OUTPUT}";
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
	rm -f reports/*;
	rm -rf ./reports/;
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
