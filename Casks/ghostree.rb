cask "ghostree" do
  version "0.2.2"
  sha256 "654c81525a3f744a8f6bb918c789104d93dbe3fa20a12e9c50529d3ec792d48c"
  asset_id = 348823040

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
