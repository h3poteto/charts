[![Build](https://github.com/h3poteto/charts/actions/workflows/build.yml/badge.svg)](https://github.com/h3poteto/charts/actions/workflows/build.yml)

# Charts

Helm charts created by h3poteto.

## How to publish
After update some charts,

```
$ helm package kms-secrets
$ helm repo index .
```

And commit package files and index file.
