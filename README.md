# LocalStack Helm Charts

Helm Charts for LocalStack. Details following soon.

## Installing the Chart

To install the chart with the release name `my-release`:

```
helm repo add localstack-charts https://localstack.github.io/helm-charts

helm upgrade --install my-release localstack-charts/localstack
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```
$ helm delete my-release
```

## License

This code is released under the Apache License, Version 2.0 (see LICENSE.txt).
