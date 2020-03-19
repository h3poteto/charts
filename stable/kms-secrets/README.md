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
| `manager.image.repository` | The image repository to pull from | `h3poteto/kms-secrets` |
| `manager.image.tag` | The image tag to pull | `v0.1.0` |
| `rbac.create` | If true, create RBAC resources | `true` |
| `rbac.serviceAccount.name` | Service Account name | `manager` |
| `rbac.serviceAccount.annotations` | Annotations to add the Service Account | `{}` |
