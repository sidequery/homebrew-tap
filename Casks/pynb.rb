cask "pynb" do
  version "0.0.0,0"
  sha256 "REPLACE_ME"
  asset_id 0

  token = ENV["HOMEBREW_GITHUB_API_TOKEN"] || ENV["GITHUB_TOKEN"]

  headers = [
    "Accept: application/octet-stream",
    "X-GitHub-Api-Version: 2022-11-28",
  ]
  headers << "Authorization: Bearer #{token}" if token

  url "https://api.github.com/repos/sidequery/homebrew-tap/releases/assets/#{asset_id}",
      verified: "github.com/sidequery/homebrew-tap/",
      header: headers

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

