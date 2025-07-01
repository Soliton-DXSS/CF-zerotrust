# 利用手順（TerraformでCloudflare設定を適用）

## 1. このリポジトリをクローン

```bash
git clone https://github.com/Soliton-DXSS/CF-zerotrust.git
cd CF-zerotrust
```

## 2. スプリットトンネル、ローカルドメインフォールバック、デバイスエンロールメントを修正

以下の設定ファイルを用途に応じて編集してください：

- **ローカルドメインフォールバック**
  - 対象ファイル：`device_custom_profile.tf`
  - 該当箇所：`resource "cloudflare_zero_trust_device_custom_profile_local_domain_fallback" "corp_ldf"` 以降
  - 内容：フォールバックさせるドメイン情報（`suffix`, `dns_server` など）を編集

- **スプリットトンネル（除外）**
  - 対象ファイル：`device_custom_profile.tf`
  - 該当箇所：`exclude` ブロック以降
  - 内容：除外対象のIPやドメインを編集

- **OTPで許可するドメイン**
  - 対象ファイル：`device_enrollment.tf`
  - 内容：One-Time PIN 認証で許可するドメインを編集（`allowed_domains` 等）

## 3. 機密情報を環境変数で設定（推奨）

```bash
export TF_VAR_cloudflare_api_token="your-api-token"
export TF_VAR_cloudflare_account_id="your-account-id"
```

## 4. Terraform を初期化

```bash
terraform init
```

## 5. 適用内容の確認

```bash
terraform plan
```

## 6. 設定の適用

```bash
terraform apply
```

---

## 🛠 事前準備（Cloudflare ダッシュボード）

Terraform を実行する前に、Cloudflare ダッシュボード上で以下の情報を取得・準備しておく必要があります：

1. **アカウント API トークン（API Token）**
   - Cloudflareのダッシュボードにログインし、アカウントホームの右の「･･･（三点メニュー）」をクリック
   - プルダウンメニューから「アカウント API トークン」を選択
   - [トークンを作成する] をクリックし、「カスタムトークンを作成する」から [始める] を選択
   - 以下の設定を行い [概要に進む] をクリック：
     - **トークン名**：任意（例：Terraform Token）
     - **権限**：`アカウント > Zero Trust > 編集` を含むこと
     - **権限**：`アカウント > アクセス: アプリおよびポリシー > 編集` を含むこと
     - **クライアント IP アドレス フィルタリング**：オペレーター「次にある」、値に接続元のIPを入力  
       IPアドレスが不明な際は https://pages.soliton.cftenant.com/ で確認してください
     - **TTL（有効期限）**：任意
   - 最後に [トークンを生成する] をクリックすると、API トークンが表示されます（この画面でのみ表示されるため、安全に保管してください）

2. **アカウント ID（Account ID）**
   - Cloudflareのダッシュボードで「アカウントの選択」画面を開き、対象アカウントの右にある「･･･（三点メニュー）」をクリック
   - プルダウンメニューから「アカウントIDをコピー」を選択すると、クリップボードにコピーされます

> これらの情報は **GitHubやファイル上に平文で保存せず、環境変数などで安全に管理することを推奨**します。
## 🧰 開発環境の前提（WSL + Terraform）

このテンプレートは WSL（Windows Subsystem for Linux）上で Terraform を利用する前提で構成されています。

### 必要な前提ソフトウェア

- **WSL2（Ubuntu推奨）**
- **Terraform CLI（バージョン 1.0 以上）**

### インストール手順（Ubuntu on WSL）

```bash
# Terraform のインストール（初回のみ）
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl unzip
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install terraform

# インストール確認
terraform -version
```

> WSLが有効になっていない場合は、Windowsの「Windowsの機能の有効化」から WSL2 を有効化し、Ubuntu を Microsoft Store からインストールしてください。
