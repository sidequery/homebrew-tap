cask "mdnb" do
  version "0.6.11,40"
  sha256 "9865be4f660e8299b0c218f2e2487da98a168c7cd93ff9d892827c0359a12dca"
  asset_id = 375035783

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
    url "https://github.com/sidequery/homebrew-tap/releases/download/mdnb-0.6.11-40/mdnb-0.6.11-40-macos14.0-arm64.zip",
        verified: "github.com/sidequery/homebrew-tap/"
  end

  name "mdnb"
  desc "Local-first Markdown notebook"
  homepage "https://github.com/sidequery/mdnb"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "mdnb.app"

  zap trash: [
    "~/Library/Caches/dev.sidequery.mdnb",
    "~/Library/Preferences/dev.sidequery.mdnb.plist",
    "~/Library/Saved Application State/dev.sidequery.mdnb.savedState",
  ]
end
