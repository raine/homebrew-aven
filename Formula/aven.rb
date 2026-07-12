class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.5/aven-darwin-arm64.tar.gz"
      sha256 "fa469cb3fd8cdac760cf76d7f40d43d4512b8b602a96a31d2a7d8d7327d4d741"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.5/aven-darwin-amd64.tar.gz"
      sha256 "521be3ecb657cc698135d43510603ea7aced7982be352319e18d17de74cafba8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.5/aven-linux-arm64.tar.gz"
      sha256 "40527fb11c8ebba143f24411e09893b154301e17b0a9339eb24632fab2420312"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.5/aven-linux-amd64.tar.gz"
      sha256 "e740b53a907cdf62f2b486c20bf94fb4f5e9a708343c636522ce202eaaf2391c"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
