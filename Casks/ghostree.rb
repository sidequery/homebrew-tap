cask "ghostree" do
  version "0.3.13"
  sha256 "df4d0bd4da039bd1ef6a5c28bbc4f64f35509b09a85526cf320048682a8da15a"
  asset_id = 359463628

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
