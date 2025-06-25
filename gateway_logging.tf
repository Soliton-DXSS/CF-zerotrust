resource "cloudflare_zero_trust_gateway_logging" "example_zero_trust_gateway_logging" {
  account_id = var.cloudflare_account_id
  redact_pii = true
  settings_by_rule_type = {
    dns = {
      log_all = false
      log_blocks = true
    }
    http = {
      log_all = false
      log_blocks = true
    }
    l4 = {
      log_all = false
      log_blocks = true
    }
  }
}