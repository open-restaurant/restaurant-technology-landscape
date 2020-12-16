# Restaurant Technology Landscape

The intention for this repository is support the set up of the infrastructure and development of the restaurant technology landscape website.

## Pre-Requisites
The following software is needed to develop this project:

  * [git](http://git-scm.com/) with [git-flow](https://github.com/nvie/gitflow)
  * [node.js](https://nodejs.org/)
  * [pulumi](https://www.pulumi.com/docs/get-started/install/)
  * [GCP CLI](https://cloud.google.com/sdk/install)

## Getting Started

### Retrieving The Source Code
[git](http://git-scm.com/) has been used as the source control for this project and the canonical repository is held by the [bitbucket](https://bitbucket.org/) service. To access this project correctly:

```bash
cd $WORKSPACE
git clone git@github.com:open-restaurant/restaurant-technology-landscape.git
cd restaurant-technology-landscape
```

### Creating GCP Environment
If there not an existing environment then please follow the instruction in the [infrastructure folder](./infrastructure/gcp/README.md).

### Website Developement
Please follow the instruction in the [website folder](./website/README.md).
