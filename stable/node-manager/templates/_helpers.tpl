{{- define "node-manager.name" -}}
{{- default .Chart.Name .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "node-manager.namespace" -}}
{{- default "default" .Release.Namespace -}}
{{- end -}}

{{- define "node-manager.serviceAccountName" -}}
{{- if .Values.rbac.create }}
    {{- printf "%s-%s" (include "node-manager.name" .) "manager" }}
{{- else -}}
    {{ default "default" .Values.rbac.serviceAccount.name }}
{{- end -}}
{{- end -}}