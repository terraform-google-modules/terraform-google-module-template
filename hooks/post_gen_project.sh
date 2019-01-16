#!/bin/bash
# Copyright 2018 Google LLC
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

# Cookiecutter does not normal symlinks (see https://github.com/audreyr/cookiecutter/issues/865)
# When the template is executed, they will become regular files that are duplicitous
# This script creates symlinks as a Cookiecutter hook after the template is executed

SHARED_FIXTURE_FILES=( outputs.tf terraform.tfvars variables.tf )
SHARED_EXAMPLE_FILES=( test_output.tf )

for file in "${SHARED_FIXTURE_FILES[@]}"; do
	for example in ./test/fixtures/*; do
		if [ "${example}" != "./test/fixtures/all_examples" ] && [ "${example}" != "./test/fixtures/shared" ]; then
			ln -s "../shared/${file}" "${example}/${file}"
		fi
	done
done

for file in "${SHARED_EXAMPLE_FILES[@]}"; do
	for example in ./examples/*; do
		ln -s "../../test/fixtures/all_examples/${file}" "${example}/${file}"
	done
done
