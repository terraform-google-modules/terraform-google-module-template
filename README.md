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
