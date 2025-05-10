{{- define "aws-global-accelerator-controller.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "aws-global-accelerator-controller.namespace" -}}
{{- default "default" .Release.Namespace -}}
{{- end -}}

{{- define "aws-global-accelerator-controller.serviceAccountName" -}}
{{- if .Values.rbac.serviceAccount.create }}
    {{- printf "%s-%s" (include "aws-global-accelerator-controller.name" .) "manager" }}
{{- else -}}
    {{ default "default" .Values.rbac.serviceAccount.name }}
{{- end -}}
{{- end -}}