cask "mdnb" do
  version "0.8.6,48"
  sha256 "7c6e3147b666fa4cd6f7a6e05157b40c254914416167bd10b81c2f0f44462f10"
  asset_id = 403120358

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
    url "https://github.com/sidequery/homebrew-tap/releases/download/mdnb-0.8.6-48/mdnb-0.8.6-48-macos15.0-arm64.zip",
        verified: "github.com/sidequery/homebrew-tap/"
  end

  name "mdnb"
  desc "Local-first Markdown notebook"
  homepage "https://github.com/sidequery/mdnb"

  depends_on macos: ">= :sequoia"
  depends_on arch: :arm64

  app "mdnb.app"

  zap trash: [
    "~/Library/Caches/dev.sidequery.mdnb",
    "~/Library/Preferences/dev.sidequery.mdnb.plist",
    "~/Library/Saved Application State/dev.sidequery.mdnb.savedState",
  ]
end
