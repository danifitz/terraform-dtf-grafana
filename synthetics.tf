data "grafana_synthetic_monitoring_probes" "main" {}

resource "grafana_synthetic_monitoring_check" "http" {
  job     = "HTTP Defaults"
  target  = "https://grafana.com"
  enabled = true
  probes = [
    data.grafana_synthetic_monitoring_probes.main.probes.Atlanta,
  ]
  frequency = 60000
  labels = {
    purpose = "test"
  }
  settings {
    http {}
  }
}