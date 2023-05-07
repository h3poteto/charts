# fluentd-sidecar-injector
This is a custom controller for Kubernetes. This controller install mutating webhook to inject fluentd container as sidecar. This chart install Custom Resource Definition and manager controller for [fluentd-sidecar-injector](https://github.com/h3poteto/fluentd-sidecar-injector). And install SidecarInjector resource for CRD.

## Installing
To install this chart with release name `my-injector`.

```
$ helm repo add h3poteto-stable https://h3poteto.github.io/charts/stable
$ helm install my-injector --namespace kube-system h3poteto-stable/fluentd-sidecar-injector
```

## Uninstalling
To uninstall the `fluentd-sidecar-injector`:

```
$ helm delete my-injector -n kube-system
```

## Configuration

Parameter | Description | Default
|---------|---------|---------|
| `image.repository` | The image repository to pull from | `ghcr.io/h3poteto/fluentd-sidecar-injector` |
| `image.tag` | The image tag to pull | `0.8.0` |
| `rbac.create` | If true, create RBAC resources | `true` |
| `rbac.serviceAccount.name` | Existing ServiceAccount to use (ignore if rbac.create=true) | `default` |
| `rbac.serviceAccount.annotations` | Annotations to add to the ServiceAccount (ignore if rbac.create=false) | `{}` |
| `useCertManager` | If true, specify `--use-cert-manager` flag to the Controller | `true` |
| `podAnnotations` | Annotations to add to the Controller Pods| `{}` |
| `podSecurityContext` | SecurityContext object for the Controller Pods | `{}` |
| `securityContext` | SecurityContext object for the Controlelr container | `{}` |
| `resources.limits.cpu` | CPU resource limits for the Controller Pods | `200m` |
| `resources.limits.memory` | Memory resource limits for the Controller Pods | `1000Mi` |
| `resources.requests.cpu` | CPU resource requests for the Controller Pods | `100m` |
| `resources.requests.memory` | Memory resource requests for the Controller Pods | `200Mi` |
| `nodeSelector` | NodeSelector object for the Controller Pods | `{}` |
| `tolerations` | Tolerations array for the Controller Pods | `{}` |
| `affinity` | Affinity object for the Controller Pods | `{}` |
| `sidecarInjector.collector` | Collector which you want to inject, this value must be `fluentd` or `fluent-bit` | `fluentd` |
| `sidecarInjector.fluentd` | FluentD configuration object, this object is ignore if collector is `fluent-bit` | `{}` |
| `sidecarInjector.fluentbit` | FluentBit configuration object, this object is ignore if collector is `fluentd` | `{}` |

### fluentd
You can specify these parameter under `sidecarInjector.fluentd`. These parameter will be override with each pod annotations. Please refer [fluentd-sidecar-injector](https://github.com/h3poteto/fluentd-sidecar-injector#annotations) for the annotations.

Parameter | Type | Example
|---------|---------|---------|
| `aggregatorHost` | string | `my-fluentd-aggregator.logging.svc` |
| `aggregatorPort` | integer | `24224` |
| `applicationLogDir` | string | `/var/opt/app/logs` |
| `dockerImage` | string | `ghcr.io/h3poteto/fluentd-sidecar-injector:lates` |
| `tagPrefix` | string | `my-log` |
| `timeFormat` | string | `%Y-%m-%dT%H:%M:%S%z` |
| `timeKey` | string | `time` |


### fluentbit

Parameter | Type | Example
|---------|---------|---------|
| `aggregatorHost` | string | `my-fluentd-aggregator.logging.svc` |
| `aggregatorPort` | integer | `24224` |
| `applicationLogDir` | string | `/var/opt/app/logs` |
| `dockerImage` | string | `ghcr.io/h3poteto/fluentd-sidecar-injector:lates` |
| `tagPrefix` | string | `my-log` |
