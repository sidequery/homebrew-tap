cask "pynb" do
  version "0.4.3,9"
  sha256 "cf1fa263e186c5ddb3700676b92e1ab922e806942e6c600b6b3539f455e62154"
  asset_id = 345507148

  token = ENV["HOMEBREW_GITHUB_API_TOKEN"] || ENV["GITHUB_TOKEN"]

  if token
    url "https://api.github.com/repos/sidequery/homebrew-tap/releases/assets/#{asset_id}",
        verified: "github.com/sidequery/homebrew-tap/",
        header: [
          "Accept: application/octet-stream",
          "Authorization: Bearer #{token}",
          "X-GitHub-Api-Version: 2022-11-28",
        ]
  else
    url "https://github.com/sidequery/homebrew-tap/releases/download/pynb-0.4.3-9/pynb-0.4.3-9-macos14.0-arm64.zip",
        verified: "github.com/sidequery/homebrew-tap/"
  end

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
