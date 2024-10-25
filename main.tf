terraform {
  required_providers {
    grafana = {
      source = "grafana/grafana"
      version = "3.5.0"
    }
  }
}

variable DF_GC_TOKEN {
    type = string
}

variable DF_GC_SYNTHETICS_TOKEN {
    type = string
}

provider "grafana" {
  url             = "https://danielfitzgerald.grafana.net/"
  auth            = var.DF_GC_TOKEN
  sm_access_token = var.DF_GC_SYNTHETICS_TOKEN
  sm_url          = "https://synthetic-monitoring-api-eu-west-2.grafana.net"
}