class Mdlint < Formula
  desc "Fast markdown linter with backlink validation"
  homepage "https://github.com/sidequery/mdlint"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sidequery/mdlint/releases/download/v#{version}/mdlint-#{version}-macos-arm64.tar.gz"
      sha256 "ed9964b04b82129aa75dcd577a5abb1c874573b98469c8bbcf83733be55f74f4"
    else
      url "https://github.com/sidequery/mdlint/releases/download/v#{version}/mdlint-#{version}-macos-x86_64.tar.gz"
      sha256 "060b8feada252858849af45938a033d35a0f457ea0a6a69695ad7d539550a657"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sidequery/mdlint/releases/download/v#{version}/mdlint-#{version}-linux-arm64.tar.gz"
      sha256 "50d6ace32004d525cd8acdf77347dbe364095db40bfdc3a54ac029a276a81324"
    else
      url "https://github.com/sidequery/mdlint/releases/download/v#{version}/mdlint-#{version}-linux-x86_64.tar.gz"
      sha256 "94f8b5489f2375c53a1ed34e073271805876a2b10c63a284423a9e9057ef08e9"
    end
  end

  def install
    bin.install "mdlint"
  end

  test do
    assert_match "mdlint", shell_output("#{bin}/mdlint --help")
  end
end
