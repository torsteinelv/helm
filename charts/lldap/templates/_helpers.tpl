{{/*
Expand the name of the chart.
*/}}
{{- define "lldap.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Create a default fullname.
*/}}
{{- define "lldap.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if .Values.fullnameOverride -}}
{{- $name = .Values.fullnameOverride -}}
{{- end -}}
{{- printf "%s" $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Common labels
*/}}
{{- define "lldap.labels" -}}
helm.sh/chart: {{ include "lldap.chart" . }}
{{ include "lldap.selectorLabels" . }}
{{- if .Values.revision }}
revision: {{ .Values.revision | quote }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "lldap.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lldap.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Chart name and version
*/}}
{{- define "lldap.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
