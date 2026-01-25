cask "ghostree" do
  version "0.1.0"
  sha256 "c77e550ec8ab121c0b58b186bea98f62242a00746b363f981082eb53917108d1"
  asset_id = 345738862

  token = ENV["HOMEBREW_GITHUB_API_TOKEN"] || ENV["GITHUB_TOKEN"]

  if token
    url "https://api.github.com/repos/sidequery/ghostree/releases/assets/#{asset_id}",
        verified: "github.com/sidequery/ghostree/",
        header: [
          "Accept: application/octet-stream",
          "Authorization: Bearer #{token}",
          "X-GitHub-Api-Version: 2022-11-28",
        ]
  else
    url "https://github.com/sidequery/ghostree/releases/download/v#{version}/Ghostree.dmg",
        verified: "github.com/sidequery/ghostree/"
  end

  name "Ghostree"
  desc "Terminal emulator with AI session sidebar"
  homepage "https://github.com/sidequery/ghostree"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "Ghostree.app"

  zap trash: [
    "~/Library/Application Support/com.mitchellh.ghostty",
    "~/Library/Caches/com.mitchellh.ghostty",
    "~/Library/Preferences/com.mitchellh.ghostty.plist",
  ]
end
