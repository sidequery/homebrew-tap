cask "mdnb" do
  version "0.6.7,35"
  sha256 "187322ac7363501ab2d4a6f0b2123e93866e6855a9c44ff010cab3f2962214fd"
  asset_id = 369799497

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
    url "https://github.com/sidequery/homebrew-tap/releases/download/mdnb-0.6.7-35/mdnb-0.6.7-35-macos14.0-arm64.zip",
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
