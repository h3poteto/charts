{{- define "eks-pod-identity-webhook-installer.name" -}}
{{- default .Chart.Name .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "eks-pod-identity-webhook-installer.namespace" -}}
{{- default "default" .Release.Namespace -}}
{{- end -}}

{{- define "eks-pod-identity-webhook-installer.serviceAccountName" -}}
{{- if .Values.rbac.create }}
    {{- printf "%s-%s" (include "eks-pod-identity-webhook-installer.name" .) "manager" }}
{{- else -}}
    {{ default "default" .Values.rbac.serviceAccount.name }}
{{- end -}}
{{- end -}}