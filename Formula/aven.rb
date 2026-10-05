class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.46"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.46/aven-darwin-arm64.tar.gz"
      sha256 "9228aa2f854595628032a5ca1370c51818b0bd9c82f37ecd3c77fe68a5ff7283"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.46/aven-darwin-amd64.tar.gz"
      sha256 "a26341c87053e0aa28d99ac351fe05307a619fe54f7cd6d6e6d96a95c6671bbd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.46/aven-linux-arm64.tar.gz"
      sha256 "9a11ed354b02acf37fab1064fb08b73b16edcc76b16408a23568c963f7326d88"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.46/aven-linux-amd64.tar.gz"
      sha256 "e1a72cb4b64d12d9f421a9b2bc845f6f2df3311c2c80a419cc429cc3bc055644"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
