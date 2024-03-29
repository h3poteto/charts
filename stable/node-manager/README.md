# node-manager

This is a custom controller for Kubernetes. This chart install Custom Resource Definition and manager controller for [node-manager](https://github.com/h3poteto/node-manager). And install NodeManager resource for CRD.

## Installing
To install this chart with release name `my-manager`.

```
$ helm repo add h3poteto-stable https://h3poteto.github.io/charts/stable
$ helm install my-manager --namespace kube-system h3poteto-stable/node-manager
```

## Uninstalling
To uninstall the `node-manager`.

```
$ helm delete my-manager -n kube-system
```

## Configuration
Please refer [example](../../examples/node-manager) to know more details.

Parameter | Description | Default
|---------|---------|---------|
| `image.repository` | The image repository to pull from | `ghcr.io/h3poteto/node-manager` |
| `image.pullPolicy` | The pull policy for the image | `IfNotPresent` |
| `image.tag` | The image tag to pull | `0.6.0` |
| `imagePullSecrets` | Secret names to pull the image | `[]` |
| `rbac.create` | If true, create RBAC resources | `true` |
| `rbac.serviceAccount.name` | Existing ServiceAccount to use (ignore if rbac.create=true) | `default` |
| `rbac.serviceAccount.annotations` | Annotations to add to the ServiceAccount (ignore if rbac.create=false) | `{}` |
| `podAnnotations` | Annotations to add to the Controller Pods | `{}` |
| `podSecurityContext` | SecurityContext object for the Controller Pods | `{}` |
| `securityContext` | SecurityContext object for the Controlelr container | `{}` |
| `resources.limits.cpu` |CPU resource limits for the Controller Pods | `200m` |
| `resources.limits.memory` | Memory resource limits for the Controller Pods | `1000Mi` |
| `resources.requests.cpu` | CPU resource requests for the Controller Pods | `100m` |
| `resources.requests.memory` | Memory resource requests for the Controller Pods | `200Mi` |
| `nodeSelector` |NodeSelector object for the Controller Pods | `{}` |
| `tolerations` | Tolerations array for the Controller Pods | `{}` |
| `affinity` |Affinity object for the Controller Pods | `{}`|
| `nodemanager.aws.region` | AWS region of your cluster is located | `us-east-1` |
| `nodemanager.aws.masters.desired` | Desired count of master instances | `""` |
| `nodemanager.aws.masters.asgModifyCoolTimeSeconds` | Cool time seconds after modify AWS AutoSaclingGroup | `""`|
| `nodemanager.aws.nasters.drainGracePeriodSeconds` | Grace period seconds when drain | `""` |
| `nodemanager.aws.masters.refreshSchedule` | Refresh schedule formatted cron, for example `23 10 * * 5` | `""` |
| `nodemanager.aws.masters.enableReplenish` | If false, node-manager does not replenish nodes | `true` |
| `nodemanager.aws.masters.autoScalingGroups` | AWS AutoScalingGroup names for masters | `[]` |
| `nodemanager.aws.workers.desired` | Desired count of worker instances | `""` |
| `nodemanager.aws.workers.asgModifyCoolTimeSeconds` | Cool time seconds after modify AWS AutoScalingGroup | `""` |
| `nodemanager.aws.workers.drainGracePeriodSeconds` | Grace period seconds when drain | `""` |
| `nodemanager.aws.workers.refreshSchedule` | Refresh schedule formatted cron, for example `23 10 * * 6` | `""` |
| `nodemanager.aws.workers.enableReplenish` | If false, node-manager does not replenish nodes | `true` |
| `nodemanager.aws.workers.autoScalingGroups` | AWS AutoScalingGroup names for workers | `[]` |

