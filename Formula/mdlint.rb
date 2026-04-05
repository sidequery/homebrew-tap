class Mdlint < Formula
  desc "Fast markdown linter with backlink validation"
  homepage "https://github.com/sidequery/mdlint"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sidequery/mdlint/releases/download/v#{version}/mdlint-#{version}-macos-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/sidequery/mdlint/releases/download/v#{version}/mdlint-#{version}-macos-x86_64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sidequery/mdlint/releases/download/v#{version}/mdlint-#{version}-linux-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/sidequery/mdlint/releases/download/v#{version}/mdlint-#{version}-linux-x86_64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "mdlint"
  end

  test do
    assert_match "mdlint", shell_output("#{bin}/mdlint --help")
  end
end
