class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.39/aven-darwin-arm64.tar.gz"
      sha256 "60188c80cab49062664cff026c83db6fb6ed9b9de0d4b3ec731917c0ab04161f"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.39/aven-darwin-amd64.tar.gz"
      sha256 "e63459b5396247962318b789e5d9dec569a69751d3ccceac2a6bf6ed55d9d5bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.39/aven-linux-arm64.tar.gz"
      sha256 "3b943962fa2875e96a8f40656f00fc2856ab8139ff3976bd53cc66dd4986b8ee"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.39/aven-linux-amd64.tar.gz"
      sha256 "1036c270e8a063d8936b7dff0a0db8bf15a1b89037f4b4da278b31b18ec7b1a7"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
