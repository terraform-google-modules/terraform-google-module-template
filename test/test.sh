#!/bin/bash
# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


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
