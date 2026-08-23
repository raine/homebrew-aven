class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.31/aven-darwin-arm64.tar.gz"
      sha256 "0e873f960293615cb299ebb43020ca7855fd31a070f255e1dd4a09d3fd3ecb28"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.31/aven-darwin-amd64.tar.gz"
      sha256 "15365c8eb2dafd6d940e2cf5ccd6a647ecdb195802d27cceb3209376a337fe85"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.31/aven-linux-arm64.tar.gz"
      sha256 "2af56505346e70677c8ac964fff87ca4673ca7db31af981f5b2e00f3b7e5bd3a"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.31/aven-linux-amd64.tar.gz"
      sha256 "7631ca6d1ef46b0f03acc0ffc88ad08c0d15da5a0a82cbb751ea74d3e0b5e7ef"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
