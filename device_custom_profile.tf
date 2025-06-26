resource "cloudflare_zero_trust_device_custom_profile" "poc_custom_profile" {
  account_id = var.cloudflare_account_id
  match = "identity.email == \"test@cloudflare.com\""
  name = "PoC Profile"
  precedence = 100
  allow_mode_switch = false
  allow_updates = true
  allowed_to_leave = true
  auto_connect = 0
  captive_portal = 180
  description = "Policy for test teams."
  disable_auto_fallback = false
  enabled = true
  exclude = [{
          "address": "10.0.0.0/8"
        },
        {
          "address": "100.64.0.0/10"
        },
        {
          "address": "169.254.0.0/16",
          "description": "DHCP Unspecified"
        },
        {
          "address": "172.16.0.0/12"
        },
        {
          "address": "192.0.0.0/24"
        },
        {
          "address": "192.168.0.0/16"
        },
        {
          "address": "224.0.0.0/24"
        },
        {
          "address": "240.0.0.0/4"
        },
        {
          "address": "255.255.255.255/32",
          "description": "DHCP Broadcast"
        },
        {
          "address": "fe80::/10",
          "description": "IPv6 Link Local"
        },
        {
          "address": "fd00::/8"
        },
        {
          "address": "ff01::/16"
        },
        {
          "address": "ff02::/16"
        },
        {
          "address": "ff03::/16"
        },
        {
          "address": "ff04::/16"
        },
        {
          "address": "ff05::/16"
        }]
  exclude_office_ips = false
  lan_allow_minutes = 0
  lan_allow_subnet_size = 24
  register_interface_ip_with_dns = true
  sccm_vpn_boundary_support = false
  service_mode_v2 = {
    mode = "warp"
  }
  support_url = ""
  switch_locked = false
  tunnel_protocol = "masque"
}

resource "cloudflare_zero_trust_device_custom_profile_local_domain_fallback" "corp_ldf" {
  account_id = var.cloudflare_account_id
  # ここがポイント ── 作成済みプロファイルの .id をそのまま渡す
  policy_id  = cloudflare_zero_trust_device_custom_profile.poc_custom_profile.id

  # LDF の設定
domains = [
  {
          suffix ="home.arpa"
        },
        {
          suffix ="intranet"
        },
        {
          suffix ="internal"
        },
        {
          suffix ="private"
        },
        {
          suffix ="localdomain"
        },
        {
          suffix ="domain"
        },
        {
          suffix ="lan"
        },
        {
          suffix ="home"
        },
        {
          suffix ="host"
        },
        {
          suffix ="corp"
        },
        {
          suffix ="local"
        },
        {
          suffix ="localhost"
        },
        {
          suffix ="invalid"
        },
        {
          suffix ="test"
        },
		{
          suffix      = "soliton.co.jp"
      description = "本社ネットワーク向け"
      dns_server  = ["10.1.1.1", "10.1.1.2"]
        }
  ]
}
