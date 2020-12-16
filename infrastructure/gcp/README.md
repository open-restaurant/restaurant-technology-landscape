# Restaurant Technology Landscape GCP Infrastructure

Welcome to the intrastructure part of the project.

To run this within your GCP project you will nned to do the following:

* Enable the [Cloud KMS API](https://console.cloud.google.com/security/kms) for your project.
* Execute the following (as it will be needed by both stacks mentioned below):
  ``` bash
  gcloud kms keyrings create cloud-build --location global
  gcloud kms keys create pulumi \
    --location global \
    --keyring cloud-build \
    --purpose encryption
  ```
* Initiate and set your GCP stack specific configuration for both:
  * [site setup](./site/README.md)
  * [manual setup](./setup/README.md)
* Using following run the appropriate cloud build triggers:
  ```bash
  gcloud beta builds triggers list
  gcloud beta builds triggers run TRIGGER_NAME
  ```
