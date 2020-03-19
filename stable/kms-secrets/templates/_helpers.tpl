{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "kms-secrets.name" -}}
{{- default .Chart.Name .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Expand the namespace of the chart.
*/}}
{{- define "kms-secrets.namespace" -}}
{{- default "default" .Release.Namespace -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "kms-secrets.serviceAccountName" -}}
{{- if .Values.rbac.create }}
    {{- printf "%s-%s" (include "kms-secrets.name" .) "manager" }}
{{- else -}}
    {{ default "default" .Values.rbac.serviceAccountName }}
{{- end -}}
{{- end -}}
