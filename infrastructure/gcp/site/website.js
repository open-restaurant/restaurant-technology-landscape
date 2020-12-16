"use strict";

const gcp = require("@pulumi/gcp");

module.exports = function (name, zone, domain, signature, branch) {
  // Create a GCP resource (Storage Bucket)
  const bucket = new gcp.storage.Bucket(name + "-website", {
    forceDestroy: true,
    website: {
      mainPageSuffix: "index.html",
      notFoundPage: "404.html",
    },
  });
  const publicRule = new gcp.storage.BucketAccessControl(name + "-public-rule", {
    bucket: bucket.name,
    role: "READER",
    entity: "allUsers",
});
  // Create a GCP resource (Backend Bucket)
  const backend = new gcp.compute.BackendBucket(name,
  {
    description: "Contains restaurant technology landscape site",
    bucketName: bucket.name,
    enableCdn: true,
  });
  const backendKey = new gcp.compute.BackendBucketSignedUrlKey(name, {
    keyValue: signature,
    backendBucket: backend.name,
});
  // Create a GCP resource (Load Balancer)
  const urlMap = new gcp.compute.URLMap(name, {
    defaultService: backend.id,
    host_rule: [{
        hosts: [ domain ],
        pathMatcher: "allpaths",
    }],
    path_matcher: [{
        name: "allpaths",
        defaultService: backend.id,
        path_rule: [{
            paths: ["/*"],
            service: backend.id,
        }],
    }],
  });
  const targetHttpProxy = new gcp.compute.TargetHttpProxy(name, {
    description: "Open Resturant target http proxy",
    urlMap: urlMap.id
  });
  const forwardingRule = new gcp.compute.GlobalForwardingRule(name, {
    target: targetHttpProxy.id,
    description: "Open Restaurant global forwarding rule",
    portRange: "80",
  });

  // Create a GCP resource (Cloud DNS record set for this static website)
  const recordSet = new gcp.dns.RecordSet(name + "-a-record", {
    type: "A",
    ttl: 300,
    managedZone: zone.name,
    name: domain + ".",
    rrdatas: [ forwardingRule.ipAddress ],
  });

  // Create a GCP resource (Cloud build to distribute to bucket upon changes)
  const websiteFeatureTrigger = new gcp.cloudbuild.Trigger(name, {
    description: "Website build",
    filename: "website/cloudbuild.yaml",
    github: {
      owner: "open-restaurant",
      name: "restaurant-technology-landscape",
      push: {
        branch: branch,
      }
    },
    includedFiles: [
      'website/**'
    ],
    ignoredFiles: [
      'infrastructure/**'
    ],
    substitutions: {
      _BUCKET_NAME: bucket.url,
    },
  });

  return bucket.url
}