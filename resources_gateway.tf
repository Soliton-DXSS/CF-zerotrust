resource "cloudflare_zero_trust_gateway_policy" "imported_6ae85a2d-e078-4f99-a5c4-efb65affc19b" {

  account_id  = var.cloudflare_account_id
  name        = "Domain_Allow-DNS_Policy"
  description = ""
  precedence  = 1153
  enabled     = true
  action      = "allow"
  filters     = ["dns"]
  traffic     = "any(dns.domains[*] in {\"example.com\"})"
  identity    = ""
}

resource "cloudflare_zero_trust_gateway_policy" "imported_df95bc68-0c2f-4f71-a505-50cbfccc74ca" {

  account_id  = var.cloudflare_account_id
  name        = "Categories_Block-DNS_Policy"
  description = ""
  precedence  = 2306
  enabled     = true
  action      = "block"
  filters     = ["dns"]
  traffic     = "any(dns.content_category[*] in {2 67 125 133 182 99 33 179 166 17 85 87 102 157 135 138 180 162 165 161 124 15 115 119 141})"
  identity    = ""
}


resource "cloudflare_zero_trust_gateway_policy" "imported_bf8b6a5a-0a05-4230-84fa-d0922fead52a" {

  account_id  = var.cloudflare_account_id
  name        = "Security_Block-DNS_Policy"
  description = ""
  precedence  = 3460
  enabled     = true
  action      = "block"
  filters     = ["dns"]
  traffic     = "any(dns.content_category[*] in {32 169 177 128}) or any(dns.security_category[*] in {68 178 80 83 176 175 117 131 134 151 153})"
  identity    = ""
}


resource "cloudflare_zero_trust_gateway_policy" "imported_4963f617-7d49-4733-b17f-5194cc91d649" {

  account_id  = var.cloudflare_account_id
  name        = "Not Inspect Rule"
  description = "To avoid TLS inspection by Cloudflare"
  precedence  = 3611
  enabled     = true
  action      = "off"
  filters     = ["http"]
  traffic     = "(any(app.ids[*] in {1245}) or any(app.type.ids[*] in {16}))"
  identity    = ""
}

