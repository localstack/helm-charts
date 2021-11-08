[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/localstack)](https://artifacthub.io/packages/search?repo=localstack)

# LocalStack Helm Charts

Helm Charts for LocalStack.

## TL;DR

```bash
$ helm repo add localstack-charts https://localstack.github.io/helm-charts
$ helm install my-release localstack-charts/localstack
```

## Introduction

LocalStack provides an easy-to-use test/mocking framework for developing Cloud applications.

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
| `extraDeploy`                                        | Extra objects to deploy (value evaluated as a template)                                                                                                                                                                               | `[]`                                                    |

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
| `extraEnvVars`                                       | Extra environment variables to be set on Localstack primary containers                                                                                                                                                                | `nil` (Localstack Default)                              |
| `enableStartupScripts`                               | Mount `/docker-entrypoint-initaws.d` to run startup scripts with `{{ template "localstack.fullname" . }}-init-scripts-config` configMap                                                                                               | `nil` (Localstack Default)                              |

### Deployment parameters

| Parameter                                            | Description                                                                                                                                                                                                                           | Default                                                 |
|------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------|
| `replicaCount`                                       | Number of Localstack pods                                                                                                                                                                                                             | `1`                                                     |
| `updateStrategy.type`                                | Update strategy type                                                                                                                                                                                                              | `RollingUpdate`                                         |
| `nodeSelector`                                       | Node labels for pod assignment                                                                                                                                                                                                        | `{}`                                                    |
| `tolerations`                                        | Tolerations for pod assignment                                                                                                                                                                                                        | `[]`                                                    |
| `tolerations`                                        | Tolerations for pod assignment                                                                                                                                                                                                        | `[]`                                                    |
| `affinity`                                           | Affinity for pod assignment                                                                                                                                                                                                           | `{}`                                                    |
| `resources.limits`                                   | The resources limits for Localstack containers                                                                                                                                                                                        | `{}`                                                    |
| `resources.requests`                                 | The requested resources for Localstack containers                                                                                                                                                                                     | `{}`                                                    |
| `livenessProbe`                                      | Liveness probe configuration for Localstack containers                                                                                                                                                                                | Same with [Kubernetes defaults][k8s-probe]              |
| `readinessProbe`                                     | Readiness probe configuration for Localstack containers                                                                                                                                                                               | Same with [Kubernetes defaults][k8s-probe]              |
| `mountDind.enabled`                                  | Specify the mount of Docker daemon into Pod to enable some AWS services that got runtime dependencies such as Lambdas on GoLang                                                                                                       | `false`                                                 |
| `mountDind.forceTLS`                                 | Specify TLS enforcement on Docker daemon communications                                                                                                                                                                               | `true`                                                  |
| `mountDind.image`                                    | Specify DinD image tag                                                                                                                                                                                                                | `docker:20.10-dind`                                     |

[k8s-probe]: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#configure-probes

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
| `service.edgeService.targetPort`                     | Port number for Localstack edge service                                                                                                                                                                                               | `4566`                                                  |
| `service.apiServices[0].targetPort`                  | Port number for Localstack elasticsearch service                                                                                                                                                                                      | `4571`                                                  |
| `service.loadBalancerIP`                             | loadBalancerIP if Localstack service type is `LoadBalancer`                                                                                                                                                                           | `nil`                                                   |
| `ingress.enabled`                                    | Enable the use of the ingress controller to access Localstack service                                                                                                                                                                 | `false`                                                 |
| `ingress.annotations`                                | Annotations for the Localstack Ingress                                                                                                                                                                                                | `{}`                                                    |
| `ingress.hosts[0].host`                              | Hostname to your Localstack Ingress                                                                                                                                                                                                   | `nil`                                                   |
| `ingress.hosts[0].paths`                             | Path within the url structure                                                                                                                                                                                                         | `[]`                                                    |
| `ingress.tls`                                        | Exsisting TLS certificates for ingress                                                                                                                                                                                                | `[]`                                                    |

### Persistence Parameters

| Name                                                 | Description                                                                                                                                                                                                                           | Value                                                   |
|------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------|
| `persistence.enabled`                                | Enable persistence using Persistent Volume Claims                                                                                                                                                                                     | `false`                                                 |
| `persistence.storageClass`                           | Persistent Volume storage class                                                                                                                                                                                                       | `""`                                                    |
| `persistence.accessModes`                            | Persistent Volume access modes                                                                                                                                                                                                        | `[]`                                                    |
| `persistence.size`                                   | Persistent Volume size                                                                                                                                                                                                                | `8Gi`                                                   |
| `persistence.dataSource`                             | Custom PVC data source                                                                                                                                                                                                                | `{}`                                                    |
| `persistence.existingClaim`                          | The name of an existing PVC to use for persistence                                                                                                                                                                                    | `""`                                                    |

## Contributing

This repo is largely community driven - we welcome your contributions!

When raising a pull request with a fix or new feature, please make sure to:
* Briefly describe the change (purpose, rationale) in the PR
* Add a short note to the Change Log in this README
* Bump the version in Chart.yaml (the chart will get automatically deployed via the CI pipeline)

## Change Log

* v0.3.7: Add the ability to set update strategy
* v0.3.6: Add the ability to deploy extra objects
* v0.3.5: Add namespace variable to metadata of resources, fix enableStartupScripts check to properly mount the config map volume
* v0.3.4: Fix volume mounts exclusion and tests
* v0.3.3: Fix ingress, annotation defaults, and pathType in chart config
* v0.3.2: Update ingress API version and support helm3
* v0.3.0: Add support for persistence
* v0.2.0: Add support for Docker-in-Docker functionality
* v0.1.5: Allow customizing livenessProbe/readinessProbe
* v0.1.4: Fix a typo that breaks the installation
* v0.1.3: Allow easy exposure of multiple API services from values config

## License

This code is released under the Apache License, Version 2.0 (see LICENSE.txt).
