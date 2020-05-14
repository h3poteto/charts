# Yadockeri
Yadockeri is a web application to install helm charts in your kubernetes cluster. This chart installs a web application and other resources for [Yadockeri](https://github.com/h3poteto/yadockeri).

## Prerequires
- Kubernetes 1.8+
- Helm 3.0.0+

## Installing the Yadockeri
To install the chart with release name `yadockeri`:

```
$ helm repo add h3poteto-stable https://h3poteto.github.io/charts/stable
$ helm install h3poteto-stable/yadockeri --name yadockeri --set config.github.organization="your_organization_name" --set config.github.client_id="id_of_your_application" --set config.github.client_secret="secret_of_your_application"
```

## Uninstalling the Chart
To uninstall the `yadockeri`:

```
$ helm delete yadockeri
```

## Configuration

Parameter | Description | Default
|------|------|------|
| `replicaCount` | Desired number of pods | `1` |
| `image.repository` | Image | `h3poteto/yadockeri` |
| `image.tag` | Image tag | `v0.4.0` |
| `resources` | Pod resource requests and limits | `{}` |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | List of node taints to tolerate | `{}` |
| `affinity` | Node or Pod affinity | `{}` |
| `podAnnotations` | Additional annotations for pods | `{}` |
| `podSecurityContext` | SecurityContext for pods | `{}` |
| `rbac.create` | If ture, create and use RBAC resources | `true` |
| `rbac.serviceAccount.annotations` | Additional annotations for the ServiceAccount | `{}` |
| `rbac.serviceAccount.name` | The name of the ServiceAccount to use. If not set and create is true, this name is generated using the name template | `nil` |
| `securityContext` | SecurityContext for containers | `{}` |
| `service.type` | Type of service to create | `ClusterIP` |
| `service.port` | Port of the service | `80` |
| `ingress.enabled` | If ture, create and use an ingress resource | `false` |
| `ingress.annotations` | Additonal annotations for the ingress | `{}` |
| `ingress.hosts` | Array of host and paths for ingress | `[{host: yadockeri.example.com, paths: []]` |
| `ingress.tls` | Set your secretName to enable tls | `[]` |
| `db.create` | If false, please specify your database informations in config | `true` |
| `db.image.repository` | Image of database | `postrgres` |
| `db.image.tag` | Image tag of database | `11.7` |
| `db.resources` | Pod resource request and limits for database | `{}` |
| `db.user` | Username of database, please change this | `root` |
| `db.password` | Password of database, please change this | `docker` |
| `db.database` | Database name | `yadockeri` |
| `config.github.organization` | GitHub organization name where the application is located which you want to deploy | `nil` |
| `config.github.client_id` | GitHub OAuth Application client id | `nil` |
| `config.github.client_secret` | GitHub OAuth Application client secret | `nil` |
| `config.session_secret` | Session token, please change this | `Zjtm4mjVeRqU6Mh774Zn2LvXPRqiH7wDY9ryx7U4N` |
| `config.db.host` | Database host name. This parameter is ignored when `db.create` is true | `nil` |
| `config.db.port` | Database port. This parameter is ignored when `db.create` is true | `5432` |
| `config.db.database` | Database name. This parameter is ignored when `db.create` is true | `yadockeri` |
| `create.db.user` | Database user name. This parameter is ignored when `db.create` is true | `nil` |
| `create.db.password` | Database password. This parameter is ignored when `db.create` is ture | `nil` |
