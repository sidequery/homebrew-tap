cask "mdnb" do
  version "0.5.0,22"
  sha256 "85a1a1fbdbcf19ffbfee9a00b257a55439d1e780f03cabe15ef0e17a6ee06dc2"
  asset_id = 363267377

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
    url "https://github.com/sidequery/homebrew-tap/releases/download/mdnb-0.5.0-22/mdnb-0.5.0-22-macos14.0-arm64.zip",
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
