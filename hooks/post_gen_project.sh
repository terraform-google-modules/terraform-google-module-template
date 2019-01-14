#!/bin/bash

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
