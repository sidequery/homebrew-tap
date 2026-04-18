cask "mdnb" do
  version "0.8.1,43"
  sha256 "884820c2560b8b605ed98ac0212cf2c2e60416a809fa53edc61b66bd04263189"
  asset_id = 399571231

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
    url "https://github.com/sidequery/homebrew-tap/releases/download/mdnb-0.8.1-43/mdnb-0.8.1-43-macos15.0-arm64.zip",
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
