# locals {
#   threshold_model_95 = <<EOT
# {
#     "conditions": [
#         {
#         "evaluator": {
#             "params": [50],
#             "type": "gt"
#         },
#         "operator": {
#             "type": "and"
#         },
#         "query": {
#             "params": ["B"]
#         },
#         "reducer": {
#             "params": [],
#             "type": "last"
#         },
#         "type": "query"
#         }
#     ],
#     "datasource": {
#         "type": "__expr__",
#         "uid": "__expr__"
#     },
#     "expression": "A",
#     "hide": false,
#     "intervalMs": 1000,
#     "maxDataPoints": 43200,
#     "refId": "B",
#     "type": "threshold"
# }
# EOT
# }

# resource "grafana_folder" "rule_folder" {
#   title = "revolut_alert_folder"
# }

# resource "grafana_rule_group" "high_cpu_service_a" {
#   name             = "revolut-group"
#   folder_uid       = grafana_folder.rule_folder.uid
#   interval_seconds = 240
#   rule {
#     name           = "revolut-alert-high-cpu(95for2m)-service-a"
#     for            = "2m"
#     condition      = "A"
#     no_data_state  = "NoData"
#     exec_err_state = "Alerting"
#     annotations = {
#       "created_by" = "terraform"
#     }
#     labels = {
#       "team"     = "service_a"
#       "severity" = "critical"
#     }
#     is_paused = false
#     data {
#       ref_id     = "A"
#       query_type = ""
#       relative_time_range {
#         from = 600
#         to   = 0
#       }
#       datasource_uid = "grafanacloud-prom"
#       model = jsonencode({
#         hide          = false
#         intervalMs    = 1000
#         instant       = true
#         maxDataPoints = 43200
#         refId         = "A"
#         expr          = "avg(irate(node_cpu_seconds_total{mode=\"idle\", job=\"pi_node_exporter\", instance=\"newpi\"}[1m]) * 100)"
#       })
#     }
#     data {
#       ref_id     = "B"
#       query_type = ""
#       relative_time_range {
#         from = 600
#         to   = 0
#       }
#       datasource_uid = "__expr__"
#       model          = local.threshold_model_95
#     }
#   }
# }
