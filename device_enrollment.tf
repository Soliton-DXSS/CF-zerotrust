resource "cloudflare_zero_trust_access_policy" "allow_company_emails" {
  account_id   = var.cloudflare_account_id
  name         = "Allow company emails"
  decision     = "allow"
  include      = [
    {
      email_domain = {
        domain = "@example.com"
      }
    }
  ]
}
