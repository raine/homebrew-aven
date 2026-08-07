class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.25/aven-darwin-arm64.tar.gz"
      sha256 "fe69c43f2c8e4adcdf3ce8556231dd6fa9f03216bc322e1184e2e00e68aaeda3"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.25/aven-darwin-amd64.tar.gz"
      sha256 "ee195e45b7728e84e3b4d4c9a1474718dc8c658ce64e1b76d2193e25a0899f4e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.25/aven-linux-arm64.tar.gz"
      sha256 "e703fcb05b295659f5190ac6cfe1ddfd200e4be647d5b9b5825a91370247211f"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.25/aven-linux-amd64.tar.gz"
      sha256 "e6409736c677f1688d5885dc2363ea3f08fe7a91a8fb74607fb72a8a70affed4"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
