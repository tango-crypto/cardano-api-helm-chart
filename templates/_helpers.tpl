{{/*
Common labels
*/}}
{{- define "cardano-api-helm-chart.labels" -}}
helm.sh/chart: {{ include "cardano-api-helm-chart.chart" . }}
{{ include "cardano-api-helm-chart.selectorLabels" . }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "cardano-api-helm-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cardano-api-helm-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Chart name
*/}}
{{- define "cardano-api-helm-chart.name" -}}
{{ .Chart.Name }}
{{- end -}}

{{/*
Chart version
*/}}
{{- define "cardano-api-helm-chart.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Full name
*/}}
{{- define "cardano-api-helm-chart.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end -}}