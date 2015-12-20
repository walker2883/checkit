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
	BASEPATH=$(dirname "$0");
	REPORTNAME="accessibility_report";
	REPORTDIRNAME="${BASEPATH}/reports";
	OUTPUT="${BASEPATH}/${REPORTNAME}.json";
}

function GENERATE_REPORT () {
	touch "${BASEPATH}/drupalpages";
	mkdir -p "${BASEPATH}/reports";
	if [[ ! "${NAME}" == "" ]]; then
		drush "${NAME}" "sqlq" "SELECT nid FROM node_access WHERE grant_view = '1'" > "${BASEPATH}/drupalpages";
	else
		drush "sqlq" "SELECT nid FROM node_access WHERE grant_view = '1'" > "${BASEPATH}/drupalpages";
	fi
	declare -a PAGESRAW=($(cat "${BASEPATH}/drupalpages"));
	declare -a PAGES=($(printf '%s\n' "${PAGESRAW[@]}" | uniq | sort --numeric-sort --reverse));
	OLDPAGEHOLDER="pagestested";
	declare -a RESULTARRAY=();
	for x in "${PAGES[@]}"; do
		RESULTARRAY+=("\"http://${URL}/node/${x}\",");
	done
	cp "${BASEPATH}/TemplatesTest/access.js" "${BASEPATH}/checkthesefiles.js";
	if [[ $(uname) == "Linux" ]]; then
		sed -Ei 's|\[\]|\['"$(echo ${RESULTARRAY[@]})"'\]|g' "${BASEPATH}/checkthesefiles.js";
		sed -Ei 's|REPORTDIRNAME|'"$(echo ${REPORTDIRNAME})"'|g' "${BASEPATH}/checkthesefiles.js";
	else
		sed -Ei "" 's|\[\]|\['"$(echo ${RESULTARRAY[@]})"'\]|g' "${BASEPATH}/checkthesefiles.js";
		sed -Ei "" 's|REPORTDIRNAME|'"$(echo ${REPORTDIRNAME})"'|g' "${BASEPATH}/checkthesefiles.js";
	fi
	# sed "s|$OLDpageholder|${resultarray[@]}|g" "${BASEPATH}/TemplatesTest/access.js" > "${BASEPATH}/checkthesefiles.js";
	node "${BASEPATH}/checkthesefiles.js";
	for X in $(ls ${BASEPATH}/reports/* | grep json); do
		nodenum=${X/${BASEPATH}\/reports\//};
		nodenum=${nodenum/.json/};
		if [[ $(uname) == "Linux" ]]; then
			if [[ -a "${X}" ]]; then sed -Ei "s|\[\{|\{\"node_$nodenum\": \[\{\"website\":\"$URL\",|" "${X}"; fi
		else
			if [[ -a "${X}" ]]; then sed -Ei "" "s|\[\{|\{\"node_$nodenum\": \[\{\"website\":\"$URL\",|" "${X}"; fi
		fi
		if [[ -a "${X}" ]]; then echo "}" >> "${X}"; fi
		js-beautify -rqf "${X}";
	done
	echo "{" > "${OUTPUT}";
	for X in "${PAGES[@]}"; do
		if [[ $(uname) == "Linux" ]]; then
			if [[ -a "${REPORTDIRNAME}/${X}.json" ]]; then sed -Ei "1 d" "${REPORTDIRNAME}/${X}.json"; fi
			if [[ -a "${REPORTDIRNAME}/${X}.json" ]]; then sed -Ei "$ d" "${REPORTDIRNAME}/${X}.json"; fi
			if [[ -a "${REPORTDIRNAME}/${X}.json" ]]; then sed -Ei "$ d" "${REPORTDIRNAME}/${X}.json"; fi
		else
			if [[ -a "${REPORTDIRNAME}/${X}.json" ]]; then sed -Ei "" "1 d" "${REPORTDIRNAME}/${X}.json"; fi
			if [[ -a "${REPORTDIRNAME}/${X}.json" ]]; then sed -Ei "" "$ d" "${REPORTDIRNAME}/${X}.json"; fi
			if [[ -a "${REPORTDIRNAME}/${X}.json" ]]; then sed -Ei "" "$ d" "${REPORTDIRNAME}/${X}.json"; fi
		fi
		if [[ -a "${REPORTDIRNAME}/${X}.json" ]]; then echo "}]," >> "${REPORTDIRNAME}/${X}.json"; fi
		if [[ -a "${REPORTDIRNAME}/${X}.json" ]]; then cat "${REPORTDIRNAME}/${X}.json" >> "${OUTPUT}"; fi
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
	if [[ -a "${BASEPATH}/drupalpages" ]]; then rm -f "${BASEPATH}/drupalpages"; fi
	if [[ -a "${BASEPATH}/reports/*" ]]; then rm -f "${BASEPATH}/reports/*"; fi
	if [[ -d "${BASEPATH}/reports/" ]]; then rm -rf "${BASEPATH}/reports/"; fi
	if [[ -a "${BASEPATH}/checkthesefiles.js" ]]; then rm "${BASEPATH}/checkthesefiles.js"; fi
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
