# KMS Secrets
KMS Secrets is custom controller for Kubernetes. This chart installs Custom Resource Definition and manager controller for [KMS Secrets](https://github.com/h3poteto/kms-secrets).

## Installing the KMS Secrets
To install the chart with release name `kms-secrets`:

```
$ helm repo add h3poteto-stable https://h3poteto.github.io/charts/stable
$ helm install h3poteto-stable/kms-secrets --name kms-secrets
```

## Uninstalling the Chart
To unsinstall the `kms-secrets`:

```
$ helm delete --purge kms-secrets
```

## Configuration

Parameter | Description | Default
|------|------|------|
| `namespace` | Namespace which you want to install | `kube-system` |
| `image.repository` | The image repository to pull from | `ghcr.io/h3poteto/kms-secrets` |
| `image.tag` | The image tag to pull | `0.1.4` |
| `tolerations` | A list of Node Tolerations | `[]` |
| `nodeSelector` | Node Selector for the pods | `{}` |
| `resources` | Resources for the `manager` container | `{ limits: { cpu: 100m, memory: 30Mi }, requests: { cpu: 100m, memory: 20Mi }` |
| `rbac.create` | If true, create RBAC resources | `true` |
| `rbac.serviceAccountName` | existing ServiceAccount to use (ignored if rbac.create=true) | `default` |
| `rbac.serviceAccount.annotations` | Annotations to add to the Service Account (ignore if rbac.create=false) | `{}` |
| `podAnnotations` | Annotations to add to the Controller Pods| `{}` |
