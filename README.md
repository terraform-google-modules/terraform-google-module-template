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

Refer to the [README][./terraform-google-{{cookiecutter.module_name}}/README.md] and [CONTRIBUTING][./terraform-google-{{cookiecutter.module_name}}/CONTRIBUTING.md]
documents of the template to understand the requirements for testing
the generated module.

Export a Service Account key and env variables:

```
export SERVICE_ACCOUNT_JSON=$(< credentials.json)
export TF_VAR_org_id="your_org_id"
export TF_VAR_folder_id="your_folder_id"
export TF_VAR_billing_account="your_billing_account_id"
```

Generate a module and execute its tests by running the following
command:

```sh
make test
```

The module will be generated at
`./staging/terraform-google-module-test`. If the tests pass, the module
will be removed; otherwise, it will be left in place for inspection.

In order to execute the test following tools need to be installed:
- `make`
- `docker`

[cookiecutter]: https://cookiecutter.readthedocs.io/
[kitchen-terraform]: https://github.com/newcontext-oss/kitchen-terraform
[contributing]: ./terraform-google-{{cookiecutter.module_name}}/CONTRIBUTING.md
[readme]: ./terraform-google-{{cookiecutter.module_name}}/README.md
