resource "cloudflare_zero_trust_gateway_logging" "example_zero_trust_gateway_logging" {
  account_id = var.cloudflare_account_id
  redact_pii = false
  settings_by_rule_type = {
    dns = {
      log_all = true
      log_blocks = false
    }
    http = {
      log_all = true
      log_blocks = false
    }
    l4 = {
      log_all = true
      log_blocks = false
    }
  }
}
