#!/bin/bash

##############################################################
# Simple Test Harness                                        #
# Instantiates the cookiecutter template, and runs its tests #
##############################################################

_curdir="$(pwd)"
cd staging || exit 1
cookiecutter --no-input "${_curdir}" module_name=module-test
cd ./terraform-google-module-test || exit 1
make docker_test_prepare
make docker_test_integration
_result=$?
if [ "$_result" -ne "0" ]; then
	make docker_test_cleanup
	exit $_result
fi
cd .. || exit 1
sudo rm -rf terraform-google-module-test
cd "${_curdir}" || exit 1
