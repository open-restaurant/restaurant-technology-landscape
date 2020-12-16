"use strict";

const pulumi = require("@pulumi/pulumi");
const gcp = require("@pulumi/gcp");
const website = require("./website");

const name = pulumi.getProject();
const config = new pulumi.Config();

// const region = config.get("gcp:region");
const signature = config.requireSecret("signature");
const domain = "open-restaurant.io";

const zone = new gcp.dns.ManagedZone(name + "-zone", {
  description: "Open Resturant DNS zone",
  dnsName: domain + ".",
});

const feature = website(name + "-feature", zone, "beta." + domain, signature, "[^master]");
const live = website(name + "-live", zone, "www." + domain, signature, "master");
