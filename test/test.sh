#!/bin/bash

##############################################################
# Simple Test Harness                                        #
# Instantiates the cookiecutter template, and runs its tests #
##############################################################

_curdir=$(pwd)
cd ..
cookiecutter --no-input "${_curdir}" module_name=module-test
cd ./terraform-google-module-test || exit 1
cp "${_curdir}/credentials.test.json" ./credentials.json
_project_id=$(cat credentials.json | jq -r '.project_id')
tee ./test/fixtures/shared/terraform.tfvars <<EOF
project_id="${_project_id}"
EOF
make test_integration_docker
_result=$?
if [ "$_result" -ne "0" ]; then
	make docker_destroy
	exit $_result
fi
cd .. || exit 1
rm -rf terraform-google-module-test
cd "${_curdir}" || exit 1
