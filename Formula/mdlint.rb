class Mdlint < Formula
  desc "Fast markdown linter with backlink validation"
  homepage "https://github.com/sidequery/mdlint"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sidequery/mdlint/releases/download/v#{version}/mdlint-#{version}-macos-arm64.tar.gz"
      sha256 "38c6c841ddde6173220dfbbe4c761435681dba984831f5e5e02a0fd1f4140c78"
    else
      url "https://github.com/sidequery/mdlint/releases/download/v#{version}/mdlint-#{version}-macos-x86_64.tar.gz"
      sha256 "3dd23c107309ec81b9d369a0cd50547fa7e942f17ba87a74f73b1d1df44f4614"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sidequery/mdlint/releases/download/v#{version}/mdlint-#{version}-linux-arm64.tar.gz"
      sha256 "dc1ada28ad82bf06c6238491e7324a2fdc857f2dbc4ef069aa032b11173b8d9b"
    else
      url "https://github.com/sidequery/mdlint/releases/download/v#{version}/mdlint-#{version}-linux-x86_64.tar.gz"
      sha256 "54289323a79aee0e28cad6f81040b8e5b5b40d15a0e27efd2812d02f356d80d7"
    end
  end

  def install
    bin.install "mdlint"
  end

  test do
    assert_match "mdlint", shell_output("#{bin}/mdlint --help")
  end
end
