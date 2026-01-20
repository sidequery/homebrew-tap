cask "pynb" do
  version "1.0,1"
  sha256 "cc977bea6ab562957814dfc33551f676f2ad3b41098790a0148d4379e1080637"
  asset_id RA_kwDOQ9uY-c4Ud9Kz

  token = ENV["HOMEBREW_GITHUB_API_TOKEN"] || ENV["GITHUB_TOKEN"]
  raise "Set HOMEBREW_GITHUB_API_TOKEN (or GITHUB_TOKEN) to download this private cask" unless token

  url "https://api.github.com/repos/sidequery/homebrew-tap/releases/assets/#{asset_id}",
      verified: "github.com/sidequery/homebrew-tap/",
      header: [
        "Accept: application/octet-stream",
        "Authorization: Bearer #{token}",
        "X-GitHub-Api-Version: 2022-11-28",
      ]

  name "pynb"
  desc "Minimal notebook app"
  homepage "https://github.com/sidequery/pynb"

  depends_on arch: :arm64

  app "pynb.app"

  zap trash: [
    "~/Library/Application Support/pynb",
    "~/Library/Caches/dev.sidequery.pynb",
    "~/Library/Preferences/dev.sidequery.pynb.plist",
  ]
end
