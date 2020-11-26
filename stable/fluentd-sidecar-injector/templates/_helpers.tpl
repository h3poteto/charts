{{- define "fluentd-sidecar-injector.name" -}}
{{- default .Chart.Name .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "fluentd-sidecar-injector.namespace" -}}
{{- default "default" .Release.Namespace -}}
{{- end -}}

{{- define "fluentd-sidecar-injector.serviceAccountName" -}}
{{- if .Values.rbac.create }}
    {{- printf "%s-%s" (include "fluentd-sidecar-injector.name" .) "manager" }}
{{- else -}}
    {{ default "default" .Values.rbac.serviceAccount.name }}
{{- end -}}
{{- end -}}