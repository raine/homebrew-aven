class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.21/aven-darwin-arm64.tar.gz"
      sha256 "d51db4c1a22c970c490e082cdb9b06e154d1ba1d1315b37a551bfdb87e8da77b"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.21/aven-darwin-amd64.tar.gz"
      sha256 "f556f3d02ee5cd3d3c32ff9ce786625809a4bc68f7eeb477e5593c0ae9b7a68b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.21/aven-linux-arm64.tar.gz"
      sha256 "f4935421ed41b2e64ca581d478b57cf09a3b742d9bda0c90a2378d3805176ac2"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.21/aven-linux-amd64.tar.gz"
      sha256 "71ed2217cf2da773d4d337dc6e4a93a3483d419fd293fcc81e8487647c62f4d4"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
