# LocalStack Helm Charts

Helm Charts for LocalStack. Details following soon.

## TL;DR

```bash
$ helm repo add localstack-charts https://localstack.github.io/helm-charts
$ helm install my-release localstack-charts/localstack
```

## Introduction

LocalStack provides an easy-to-use test/mocking framework for developing Cloud applications.

Currently, the focus is primarily on supporting the AWS cloud stack.

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add localstack-charts https://localstack.github.io/helm-charts
$ helm install my-release localstack-charts/localstack
```

These commands deploy LocalStack on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

The following table lists the configurable parameters of the Localstack chart and their default values.

### Common parameters

| Parameter                                            | Description                                                                                                                                                                                                                           | Default                                                 |
|------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------|
| `nameOverride`                                       | String to partially override common.names.fullname                                                                                                                                                                                    | `nil`                                                   |
| `fullnameOverride`                                   | String to fully override common.names.fullname                                                                                                                                                                                        | `nil`                                                   |

### Localstack common parameters

| Parameter                                            | Description                                                                                                                                                                                                                           | Default                                                 |
|------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------|
| `image.repository`                                   | Localstack image name                                                                                                                                                                                                                 | `localstack/localstack`                                 |
| `image.tag`                                          | Localstack image tag                                                                                                                                                                                                                  | `latest`                                                |
| `image.pullPolicy`                                   | Localstack image pull policy                                                                                                                                                                                                          | `IfNotPresent`                                          |
| `image.pullSecrets`                                  | Specify docker-registry secret names as an array                                                                                                                                                                                      | `[]`                                                    |
| `podAnnotations`                                     | Additional pod annotations for Localstack secondary pods                                                                                                                                                                              | `{}`                                                    |
| `podSecurityContext`                                 | Enable security context for Localstack pods                                                                                                                                                                                           | `{}`                                                    |
| `securityContext`                                    | Localstack container securityContext                                                                                                                                                                                                  | `{}`                                                    |

### Localstack parameters

| Parameter                                            | Description                                                                                                                                                                                                                           | Default                                                 |
|------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------|
| `debug`                                              | Specify if debug logs should be enabled                                                                                                                                                                                               | `false`                                                 |
| `kinesisErrorProbability`                            | Specify to randomly inject ProvisionedThroughputExceededException errors into Kinesis API responses                                                                                                                                   | `nil` (Localstack Default)                              |
| `startServices`                                      | Specify service names (APIs) to start up                                                                                                                                                                                              | `nil` (Localstack Default)                              |
| `lambdaExecutor`                                     | Specify Method to use for executing Lambda functions (partially supported)                                                                                                                                                            | `docker`                                                |
| `dataDir`                                            | Specify directory for saving persistent data (Not supported yet)                                                                                                                                                                      | `nil` (Localstack Default)                              |
| `extraEnvVars`                                       | Extra environment variables to be set on Localstack primary containers                                                                                                                                                                | `nil` (Localstack Default)                              |

### Deployment parameters

| Parameter                                            | Description                                                                                                                                                                                                                           | Default                                                 |
|------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------|
| `replicaCount`                                       | Number of Localstack pods                                                                                                                                                                                                             | `1`                                                     |
| `nodeSelector`                                       | Node labels for pod assignment                                                                                                                                                                                                        | `{}`                                                    |
| `tolerations`                                        | Tolerations for pod assignment                                                                                                                                                                                                        | `[]`                                                    |
| `tolerations`                                        | Tolerations for pod assignment                                                                                                                                                                                                        | `[]`                                                    |
| `affinity`                                           | Affinity for pod assignment                                                                                                                                                                                                           | `{}`                                                    |
| `resources.limits`                                   | The resources limits for Localstack containers                                                                                                                                                                                        | `{}`                                                    |
| `resources.requests`                                 | The requested resources for Localstack containers                                                                                                                                                                                     | `{}`                                                    |

### RBAC parameters

| Parameter                                            | Description                                                                                                                                                                                                                           | Default                                                 |
|------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------|
| `serviceAccount.create`                              | Enable the creation of a ServiceAccount for Localstack pods                                                                                                                                                                           | `true`                                                  |
| `serviceAccount.name`                                | Name of the created ServiceAccount                                                                                                                                                                                                    | Generated using the `common.names.fullname` template    |
| `serviceAccount.annotations`                         | Annotations for Localstack Service Account                                                                                                                                                                                            | `{}`                                                    |

### Exposure parameters

| Parameter                                            | Description                                                                                                                                                                                                                           | Default                                                 |
|------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------|
| `service.type`                                       | Kubernetes Service type                                                                                                                                                                                                               | `NodePort`                                              |
| `service.edgePort`                                   | Port number for Localstack edge service                                                                                                                                                                                               | `4566`                                                  |
| `service.esPort`                                     | Port number for Localstack elasticsearch service                                                                                                                                                                                      | `4571`                                                  |
| `service.loadBalancerIP`                             | loadBalancerIP if Localstack service type is `LoadBalancer`                                                                                                                                                                           | `nil`                                                   |
| `ingress.enabled`                                    | Enable the use of the ingress controller to access Localstack service                                                                                                                                                                 | `false`                                                 |
| `ingress.annotations`                                | Annotations for the Localstack Ingress                                                                                                                                                                                                | `{}`                                                    |
| `ingress.hosts[0].host`                              | Hostname to your Localstack Ingress                                                                                                                                                                                                   | `nil`                                                   |
| `ingress.hosts[0].paths`                             | Path within the url structure                                                                                                                                                                                                         | `[]`                                                    |
| `ingress.tls`                                        | Exsisting TLS certificates for ingress                                                                                                                                                                                                | `[]`                                                    |