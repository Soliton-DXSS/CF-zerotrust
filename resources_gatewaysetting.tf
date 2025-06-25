resource "cloudflare_zero_trust_gateway_settings" "example_zero_trust_gateway_settings" {
  account_id = var.cloudflare_account_id
  settings = {
    activity_log = {
      enabled = true
    }
    antivirus = {
      enabled_download_phase = false
      enabled_upload_phase = false
      fail_closed = false
      notification_settings = {
        enabled = true
        include_context = true
        msg = "msg"
        support_url = "https://example.com"
      }
    }
    app_control_settings = {
      enabled = false
    }
    block_page = {
      enabled = false
    }
    body_scanning = {
      inspection_mode = "deep"
    }
    browser_isolation = {
      non_identity_enabled = true
 #     url_browser_isolation_enabled = true
    }
    custom_certificate = {
      enabled = false
    }
    extended_email_matching = {
      enabled = true
    }
    fips = {
      tls = true
    }
    host_selector = {
      enabled = false
    }
    protocol_detection = {
      enabled = true
    }
    sandbox = {
      enabled = true
      fallback_action = "allow"
    }
    tls_decrypt = {
      enabled = true
    }
  }
}