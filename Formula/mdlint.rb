class Mdlint < Formula
  desc "Fast markdown linter with backlink validation"
  homepage "https://github.com/sidequery/mdlint"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sidequery/mdlint/releases/download/v#{version}/mdlint-#{version}-macos-arm64.tar.gz"
      sha256 "2ecdc36b09b768234b68d66230cb7866145543875dcd2090730c040c3d8579a3"
    else
      url "https://github.com/sidequery/mdlint/releases/download/v#{version}/mdlint-#{version}-macos-x86_64.tar.gz"
      sha256 "f608af886ee0cc3b0327cdfdc9de88cff1449c747035b90f112ba866210b88ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sidequery/mdlint/releases/download/v#{version}/mdlint-#{version}-linux-arm64.tar.gz"
      sha256 "ade1f02b4a0715224a32db13ef82338aa2d2ebd3210b7bdc3d9a2ef89edfe1e5"
    else
      url "https://github.com/sidequery/mdlint/releases/download/v#{version}/mdlint-#{version}-linux-x86_64.tar.gz"
      sha256 "3924705cc84ebdcdb0c267ee972d9c590edda43c36903c29337eed14170056e9"
    end
  end

  def install
    bin.install "mdlint"
  end

  test do
    assert_match "mdlint", shell_output("#{bin}/mdlint --help")
  end
end
