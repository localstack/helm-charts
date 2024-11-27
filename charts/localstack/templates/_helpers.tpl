{{/*
Expand the name of the chart.
*/}}
{{- define "localstack.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "localstack.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "localstack.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "localstack.labels" -}}
helm.sh/chart: {{ include "localstack.chart" . }}
{{ include "localstack.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- with .Values.extraLabels }}
{{- range $label, $value := index . }}
{{ $label }}: {{ tpl $value $ | quote }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "localstack.selectorLabels" -}}
app.kubernetes.io/name: {{ include "localstack.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "localstack.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "localstack.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
{{/*
Create the role name for the pods/* role
*/}}
{{- define "localstack.roleName" -}}
{{- if .Values.role.create }}
{{- default (include "localstack.fullname" .) .Values.role.name }}
{{- else }}
{{- default "default" .Values.role.name }}
{{- end }}
{{- end }}

{{/*
Create the RoleBinding name for the service account
*/}}
{{- define "localstack.roleBindingName" -}}
{{- if .Values.role.create }}
{{- default (include "localstack.fullname" .) .Values.role.name }}
{{- else }}
{{- default "default" .Values.role.name }}
{{- end }}
{{- end }}

{{- define "localstack.lambda.prepare_labels" -}}
{{- if .Values.lambda.labels }}
{{- range $key, $value := .Values.lambda.labels -}}
  {{ $key }}={{ $value }},
{{- end }}
{{- end }}
{{- end }}

{{- define "localstack.lambda.labels" -}}
{{- if include "localstack.lambda.prepare_labels" . -}}
  {{ include "localstack.lambda.prepare_labels" . | trimSuffix "," }}
{{- end }}
{{- end }}

{{/*
Add extra annotations to every resource
*/}}
{{- define "localstack.annotations" -}}
{{- with .Values.extraAnnotations }}
{{- range $annotation, $value := index . }}
{{ $annotation }}: {{ tpl $value $ | quote }}
{{- end }}
{{- end }}
{{- end }}