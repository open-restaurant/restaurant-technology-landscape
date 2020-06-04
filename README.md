# Restaurant Technology Landscape

## Prerequisites
The following is needed to execute this application:

* [git](https://git-scm.com/)
* [node.js](https://nodejs.org/en/)

## Local Development Set Up

The following assumes you are in the root of the project folder using cli. Enabling you to see review changes to the interactive landscape:

```
npm install
mkdir cached_logos
npm run build
npm run open:dist
```

# TODO:
## settings.yml
* `global`
  * `repo` attribute value to be `open-restaurant/restaurant-technology-landscape`.
  * `self` attribute value to be the appropriate crunchbase URL.
  * `slack_channel` attribute value to be the appropriate value once slack has been set up.
  * `meta`
    * Add back `fb_admin` with appropriate value if we have facebook support
    * `twitter` attribute value to be the appropriate value once twitter has been set up.
    * `google_site_verification` attribute value to be the appropriate value once google web master has been set up.
    * `ms_validate` attribute value to be the appropriate value once bing web tool has been set up.
## hosted_images
Some of these need to be cleaned up as I converted them using https://www.pngtosvg.com/

## landscape.yml
The following attributes will most likely need to be revisited once we have the appropriate Crunchbase and Twitter accounts and API keys:
* `crunchbase`
* `twitter`

Also an item can be made up of the following attributes:
* `name`
* `homepage_url`
* `logo`
* `crunchbase`
* `twitter`
* `repo_url`