# 利用手順（TerraformでCloudflare設定を適用）

## 1. このリポジトリをクローン

```bash
git clone git@github.com:Soliton-DXSS/CF-zerotrust.git
cd CF-zerotrust
```

## 2. 機密情報を環境変数で設定（推奨）

```bash
export TF_VAR_cloudflare_api_token="your-api-token"
export TF_VAR_cloudflare_account_id="your-account-id"
export TF_VAR_psk="your-ipsec-psk"  # ※必要な場合のみ
```

## 3. Terraform を初期化

```bash
terraform init
```

## 4. 適用内容の確認

```bash
terraform plan
```

## 5. 設定の適用

```bash
terraform apply
```

---

> 💡 `psk` を使わない構成（Magic WAN未使用）の場合は `TF_VAR_psk` の設定は省略可能です。
