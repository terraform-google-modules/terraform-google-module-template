# CFT Module Template

A template for starting a Cloud Foundation Toolkit Terraform module.

## Usage

The template must be rendered using [Cookiecutter][cookiecutter].

Generate a new module by running the following command:

`cookiecutter https://github.com/terraform-google-modules/terraform-google-module-template.git`

## Generated Module

A newly generated module includes logic to create a Google Cloud
Storage bucket, a functional example module, and
[Kitchen-Terraform][kitchen-terraform] integration tests. All of this
content should be modified to suit the purpose of the new module.

## Testing

Changes to this template must be tested to ensure that generated
modules remain functional.

Refer to the [README][readme] and [CONTRIBUTING][contributing]
documents of the template to understand the requirements for testing
the generated module.

The key for the service account described in the README must be located
at `./credentials.test.json`.

Generate a module and execute its tests by running the following
command:

```sh
PROJECT_ID="<ID of test project>" \
SERVICE_ACCOUNT_JSON="$(cat ./credentials.test.json)" \
make test
```

The module will be generated at
`./staging/terraform-google-module-test`. If the tests pass, the module
will be removed; otherwise, it will be left in place for inspection.

In order to execute the test following tools need to be installed:
- `make`
- `docker`
- `jq`

[cookiecutter]: https://cookiecutter.readthedocs.io/
[kitchen-terraform]: https://github.com/newcontext-oss/kitchen-terraform
[contributing]: ./terraform-google-{{cookiecutter.module_name}}/CONTRIBUTING.md
[readme]: ./terraform-google-{{cookiecutter.module_name}}/README.md
