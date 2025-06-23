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

## 🛠 事前準備（Cloudflare ダッシュボード）

Terraform を実行する前に、Cloudflare ダッシュボード上で以下の情報を取得・準備しておく必要があります：

1. **API トークン（API Token）**
   - [Cloudflareのダッシュボード](https://dash.cloudflare.com/profile/api-tokens) にログイン
   - 「API Tokens」から **"Edit Cloudflare Zero Trust settings" に必要な権限を持つトークン** を作成・取得
   - 最低限必要なスコープ例：
     - `Account > Zero Trust Gateway > Edit`

2. **アカウント ID（Account ID）**
   - ダッシュボード左上の「Overview（概要）」から確認可能
   - Terraform の変数 `cloudflare_account_id` に指定します

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
