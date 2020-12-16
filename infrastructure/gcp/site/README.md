# Restaurant Technology Landscape Website Infrastructure

This will allow you to create & update GCP infrastructure need for the website via pulumi automation.
This include a build and deployment Cloud Build of the website.

## Pre-Requisites

The following software is needed to develop this project:

  * [git](http://git-scm.com/) with [git-flow](https://github.com/nvie/gitflow)
  * [node.js](https://nodejs.org/)
  * [pulumi](https://www.pulumi.com/docs/get-started/install/)

## First Time Execution Steps:
* Execute the following within the same folder as this file:
  ```bash
  pulumi stack init $YOUR_NAME --secrets-provider gcpkms://projects/$YOUR_PROJECT_HERE/locations/global/keyRings/cloud-build/cryptoKeys/pulumi
  pulumi config set gcp:project $YOUR_PROJECT_HERE
  pulumi config set gcp:region europe-west1
  pulumi config set gcp:zone b
  head -c 16 /dev/urandom | base64 | tr +/ -_ | xargs -I {} pulumi config set --secret  signature {}
  ```

## Developing Stack
You can bring the stack up to ensure the infrastructure and site runs as expected:
```bash
pulumi up
```
To removed it:
```bash
pulumi destroy
```