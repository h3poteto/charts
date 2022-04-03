[![Build](https://github.com/h3poteto/charts/actions/workflows/build.yml/badge.svg)](https://github.com/h3poteto/charts/actions/workflows/build.yml)
[![Package](https://github.com/h3poteto/charts/actions/workflows/package.yml/badge.svg)](https://github.com/h3poteto/charts/actions/workflows/package.yml)
[![pages-build-deployment](https://github.com/h3poteto/charts/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/h3poteto/charts/actions/workflows/pages/pages-build-deployment)

# Charts

Helm charts created by h3poteto.

## How to use
For example,

```
$ helm repo add h3poteto-stable https://h3poteto.github.io/charts/stable
$ helm repo update
$ helm install h3poteto-stable/fluentd-sidecar-injector --namespace kube-system fluentd-sidecar-injector
```
