cask "pynb" do
  version "0.1.0,1"
  sha256 "94a93cd8d6fb46e63cd777d7bb133cf421deb0d90bb2d70d2960e0f91fa9addf"
  asset_id = 343401793

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
    url "https://github.com/sidequery/homebrew-tap/releases/download/pynb-0.1.0-1/pynb-0.1.0-1-macos14.0-arm64.zip",
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
