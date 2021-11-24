{{/*
Create chart release.
*/}}
{{- define "teste-helm.release" -}}
{{- printf .Values.app.release }}
{{- end }}

{{/*
Create chart namespace.
*/}}
{{- define "teste-helm.namespace" -}}
{{- printf .Values.app.namespace }}
{{- end }}

{{/*
Create chart repository.
*/}}
{{- define "teste-helm.repository" -}}
{{- printf .Values.image.repository }}
{{- end }}

{{/*
Create chart environment.
*/}}
{{- define "teste-helm.environment" -}}
{{- printf .Values.app.environment }}
{{- end }}

{{/*
Expand the name of the chart.
*/}}
{{- define "teste-helm.name" -}}
{{- printf .Values.app.name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "teste-helm.fullname" -}}
{{- printf .Values.app.fullname | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "teste-helm.hosts.hosts" -}}
{{- printf .Values.app.name }}
{{- end }}

{{/*
Common labels
{{ include "teste-helm.selectorLabels" . }}
*/}}
{{- define "teste-helm.labels" -}}
helm.sh/chart: {{ include "teste-helm.fullname" . }}
deployment: {{ include "teste-helm.fullname" . }}
app: {{ include "teste-helm.fullname" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
app.kubernetes.io/name: {{ include "teste-helm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
*/}}
{{- define "teste-helm.selectorLabels" -}}
deployment: {{ include "teste-helm.release" . }}
app: {{ include "teste-helm.fullname" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "teste-helm.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "teste-helm.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
