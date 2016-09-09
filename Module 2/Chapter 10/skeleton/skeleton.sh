#!/usr/bin/env bash

usage() { echo "Usage: $0 [-p <Playbook Path>] [-t <Playbook Title>]" 1>&2; exit 1; }

while getopts ":p:t:" OPTION; do
    case "${OPTION}" in
        p)
            PROJECT_PATH=${OPTARG}
            ;;
        t)
            PLAYBOOK_TITLE=${OPTARG}
            ;;
    esac
done

if [ -z ${PROJECT_PATH} ]; then
	echo "You need to supply a Project Path"
	exit 1
fi

if [ -z ${PLAYBOOK_TITLE} ]; then
	echo "You need to supply a Project Title"
	exit 1
fi

	 
PLAYBOOK_PATH="${PROJECT_PATH}/${PLAYBOOK_TITLE}"

mkdir -p "${PLAYBOOK_PATH}/files"
mkdir -p "${PLAYBOOK_PATH}/group_vars"
mkdir -p "${PLAYBOOK_PATH}/host_vars/dev"
mkdir -p "${PLAYBOOK_PATH}/host_vars/uat"
mkdir -p "${PLAYBOOK_PATH}/host_vars/prd"
mkdir -p "${PLAYBOOK_PATH}/inventories"
mkdir -p "${PLAYBOOK_PATH}/roles"

ansible-galaxy init common -p "${PLAYBOOK_PATH}/roles/" --force

touch "${PLAYBOOK_PATH}/inventories/dev"
touch "${PLAYBOOK_PATH}/inventories/uat"
touch "${PLAYBOOK_PATH}/inventories/prd"
touch "${PLAYBOOK_PATH}/${PLAYBOOK_TITLE}.yml"

