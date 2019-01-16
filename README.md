# CFT Module Template

A collection of boilerplate for starting a Cloud Foundation Toolkit module with `test-kitchen`, `inspec-gcp`, and `kitchen-terraform` testing frameworks.

## Use

1. Create the new repository: `cookiecutter https://github.com/terraform-google-modules/terraform-google-module-template.git`

## Example Module - Bucket Creation

Note that for illustrative purposes, this template will create a module that creates a Google Cloud Storage bucket and runs tests against it, to illustrate the full testing pipeline. References to this bucket should be removed before use.

### Testing

To run the example module tests after creating a new repository:

- Create a Service Account key in `/credentials.json` (relative to the new repository location)
- `cp test/fixtures/shared/terraform.tfvars.sample test/fixtures/shared/terraform.tfvars` and edit `test/fixtures/shared/terraform.tfvars`
- Run `make test_integration_docker`.

## Automated Testing

When making changes to this template, the tests on the example module should be run to sanity-check changes, with the goal of ensuring that this template is functional at all times. These steps have been automated, and can be run as follows:

1. Download a service account key for the project in which you want to run the generated module's tests as `/credentials.test.json`
2. Run `make test`

If the automated test fails, it will clean up resources that the module created, and leave `../terraform-google-module-test` in place for review. Otherwise, all resources will be cleaned up, and the generated module will be deleted.
