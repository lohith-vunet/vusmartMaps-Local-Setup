{{/*
Return the fully qualified app name.
*/}}
{{- define "vublock-store.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- $namespace := .Release.Namespace -}}
{{- printf "%s-%s" $name $namespace | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Return the name of the chart.
*/}}
{{- define "vublock-store.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/*
Return the chart labels.
*/}}
{{- define "vublock-store.labels" -}}
helm.sh/chart: {{ include "vublock-store.name" . }}-{{ .Chart.Version | replace "+" "_" }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Return the selector labels.
*/}}
{{- define "vublock-store.selectorLabels" -}}
app.kubernetes.io/name: {{ include "vublock-store.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
