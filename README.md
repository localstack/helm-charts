<p align="center">
  <img src="https://raw.githubusercontent.com/localstack/localstack/master/docs/localstack-readme-banner.svg" alt="LocalStack - A fully functional local cloud stack">
</p>

<h1 align="center">LocalStack Helm Charts</h1>

<p align="center">
  Helm charts for LocalStack.
</p>

<p align="center">
  <a href="https://github.com/localstack/helm-charts/actions/workflows/chart-lint-test-release.yaml"><img alt="Pipeline Status" src="https://github.com/localstack/helm-charts/actions/workflows/chart-lint-test-release.yaml/badge.svg"></a>
  <a href="https://twitter.com/_localstack"><img alt="Twitter" src="https://img.shields.io/twitter/url/http/shields.io.svg?style=social"></a>
</p>

<p align="center">
  <i>LocalStack</i> provides an easy-to-use test/mocking framework for developing Cloud applications.
</p>

<p align="center">
  <a href="#overview">Overview</a> •
  <a href="#change-log">Changelog</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#get-in-touch">Get In Touch</a> •
  <br>–<br>
  <a href="https://docs.localstack.cloud" target="_blank">📖 Docs</a> •
  <a href="https://app.localstack.cloud" target="_blank">💻 Pro version</a> •
  <a href="https://docs.localstack.cloud/aws/feature-coverage/" target="_blank">☑️ Feature coverage</a>
</p>

---

## Overview

[LocalStack 💻](https://localstack.cloud) is a cloud service emulator that runs in a single container on your laptop or in your CI environment. With LocalStack, you can run your AWS applications or Lambdas entirely on your local machine without connecting to a remote cloud provider! Whether you are testing complex CDK applications or Terraform configurations, or just beginning to learn about AWS services, LocalStack helps speed up and simplify your testing and development workflow.

LocalStack supports a growing number of AWS services, like AWS Lambda, S3, Dynamodb, Kinesis, SQS, SNS, and **many** more! The [**Pro version** of LocalStack](https://localstack.cloud/pricing) supports additional APIs and advanced features. You can find a comprehensive list of supported APIs on our [☑️ Feature Coverage](https://docs.localstack.cloud/aws/feature-coverage/) page.

LocalStack also provides additional features to make your life as a cloud developer easier! Check out LocalStack's [Cloud Developer Tools](https://docs.localstack.cloud/tools/) for more information.

## TL;DR

```bash
$ helm repo add localstack https://localstack.github.io/helm-charts
$ helm search repo <keyword>
$ helm install <name> localstack/<chart>
```

## Before you begin

### Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+

### Setup a Kubernetes Cluster

For setting up Kubernetes refer to the Kubernetes [getting started guide](https://kubernetes.io/docs/getting-started-guides/).

### Install Helm

Helm is a tool for managing Kubernetes charts. Charts are packages of pre-configured Kubernetes resources.

To install Helm, refer to the [Helm install guide](https://github.com/helm/helm#install) and ensure that the `helm` binary is in the `PATH` of your shell.

### Add Repo

The following command allows you to download and install all the charts from this repository:

```bash
$ helm repo add localstack https://localstack.github.io/helm-charts
```

### Using Helm

Once you have installed the Helm client, you can deploy a Helm chart into a Kubernetes cluster.

Please refer to the [Quick Start guide](https://helm.sh/docs/intro/quickstart/) if you wish to get running in just a few commands, otherwise the [Using Helm Guide](https://helm.sh/docs/intro/using_helm/) provides detailed instructions on how to use the Helm client to manage packages on your Kubernetes cluster.

Useful Helm Client Commands:
* View available charts: `helm search repo`
* Install a chart: `helm install <name> localstack/<chart>`
* Upgrade your application: `helm upgrade`

### Using the chart in OpenShift

Running LocalStack on OpenShift requires specific Security Context Constraints (SCC) to be applied to ensure proper deployment and operation.
In the OpenShift Container Platform, you can use SCCs to control permissions for the pods in your cluster.

Default SCCs are created during installation and when you install some Operators or other components. As a cluster administrator,
you can also create your own SCCs.

The cluster contains several default security context constraints (SCCs). The available Security Context Constraints are:

* anyuid
* hostaccess
* hostmount-anyuid
* hostnetwork
* node-exporter
* nonroot
* privileged
* restricted

Example:

```yaml
role:
  extraRoles:
    - apiGroups: ["security.openshift.io"]
      resources: ["securitycontextconstraints"]
      resourceNames: ["anyuid"]
      verbs: ["use"]
```

For a more comprehensive overview, see the official SCC documentation: [OpenShift SCCs](https://docs.openshift.com/container-platform/4.16/authentication/managing-security-context-constraints.html)

## Change Log

Please refer to [GitHub releases](https://github.com/localstack/helm-charts/releases) to see the complete list of changes for each release.

## Contributing

If you are interested in contributing to LocalStack:

- Navigate our codebase and [open issues](https://github.com/localstack/helm-charts/issues).

We are thankful for all the contributions and feedback we receive.

## Get In Touch

To get in touch with LocalStack team for bugs/feature requests, support questions or general discussions, please use:

- [LocalStack Slack Community](https://localstack.cloud/contact/)
- [LocalStack Discussion Page](https://discuss.localstack.cloud/t/localstack-helm-charts/80)
- [LocalStack Helm Charts GitHub Issue tracker](https://github.com/localstack/helm-charts/issues)

## License

This version of LocalStack is released under the Apache License, Version 2.0 (see LICENSE.txt).
