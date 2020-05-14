{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}

{{- define "yadockeri.name" -}}
{{- default .Chart.Name .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Expand the namespace of the chart.
*/}}
{{- define "yadockeri.namespace" -}}
{{- default "default" .Release.Namespace -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "yadockeri.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "yadockeri.labels" -}}
helm.sh/chart: {{ include "yadockeri.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kuberentes.io/part-of: {{ include "yadockeri.name" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "yadockeri.controllerLabels" -}}
app.kubernetes.io/name: controller
app.kubernetes.io/component: web
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "yadockeri.serviceAccountName" -}}
{{- if .Values.rbac.create }}
{{- default (include "yadockeri.name" .) .Values.rbac.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.rbac.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "yadockeri.config.name" -}}
yadockeri-env
{{- end }}

{{- define "db.config.name" -}}
yadockeri-db-env
{{- end }}

{{- define "db.host" -}}
{{- if .Values.db.create }}
{{- printf "%s-%s" (include "yadockeri.name" .) "db" }}
{{- else -}}
{{- .Values.config.db.host }}
{{- end -}}
{{- end -}}

{{- define "db.database" -}}
{{- if .Values.db.create }}
{{- .Values.db.database }}
{{- else -}}
{{- .Values.config.db.database }}
{{- end -}}
{{- end -}}

{{- define "db.user" -}}
{{- if .Values.db.create }}
{{- .Values.db.user }}
{{- else -}}
{{- .Values.config.db.user }}
{{- end -}}
{{- end -}}

{{- define "db.password" -}}
{{- if .Values.db.create }}
{{- .Values.db.password }}
{{- else -}}
{{- .Values.config.db.password }}
{{- end -}}
{{- end -}}

{{- define "yadockeri.dbLabels" -}}
app.kubernetes.io/name: postgres
app.kubernetes.io/component: db
{{- end }}