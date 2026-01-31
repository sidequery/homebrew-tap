cask "pynb" do
  version "0.4.15,23"
  sha256 "d44e3a5b45a4ab196b043f1e98d09e5b319ad69209d238bfd1aabfd4b5cf3bf1"
  asset_id = 348518567

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
    url "https://github.com/sidequery/homebrew-tap/releases/download/pynb-0.4.15-23/pynb-0.4.15-23-macos14.0-arm64.zip",
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
