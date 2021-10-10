# EKS Pod Identity Webhook Installer
This is a controller to install [Amazon EKS Pod Identity Webhook](https://github.com/aws/amazon-eks-pod-identity-webhook) to your Kubernetes cluster. This chart install Custom Resource Definition and manager controller for [eks-pod-identity-webhook-installer](https://github.com/h3poteto/eks-pod-identity-webhook-installer). And install Installer resource as Custom Resource.

## Installing
To install this chart with release name `my-installer`.

```
$ helm repo add h3poteto-stable https://h3poteto.github.io/charts/stable
$ helm install my-installer --namespace kube-system h3poteto-stable/eks-pod-identity-webhook-installer
```


## Uninstalling
To uninstall the `eks-pod-identity-webhook-installer`:

```
$ helm delete my-installer -n kube-system
```


## Configuration

Parameter | Description | Default
|---------|---------|---------|
| `image.repository` | The image repository to pull from | `ghcr.io/h3poteto/eks-pod-identity-webhook-installer` |
| `image.pullPolicy` | The image pull policy | `IfNotPresent` |
| `image.tag` | The image tag to pull | `0.1.1` |
| `imagePullSecrets` | Secret names to pull the image | `[]` |
| `rbac.create` | If true, create RBAC resources | `true` |
| `rbac.serviceAccount.name` | Existing ServiceAccount to use (ignore if rbac.create=true) | `default` |
| `rbac.serviceAccount.annotations` | Annotations to add to the ServiceAccount (ignore if rbac.create=false) | `{}` |
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
| `eksPodIdentityWebhookInstaller.tokenAudience` | This parameter is passed eks-pod-identity-webhook as a arugment `--token-audience`  | `amazonaws.com` |
| `eksPodIdentityWebhookInstaller.namespace` | Namespace where eks-pod-identity-webhook is deployed | `default` |

