class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.30/aven-darwin-arm64.tar.gz"
      sha256 "36face405c999d21d6679633d02b349de2ecc6b2bbf04d86311bb6f25d6da46d"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.30/aven-darwin-amd64.tar.gz"
      sha256 "d3677a71c564cf9014859802c098f89e29ca752ede57a53f9726ac139999409f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.30/aven-linux-arm64.tar.gz"
      sha256 "3696a7294592ba7b29e37e3e6097c43bdba38953e3e56f97376a08df76d00f86"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.30/aven-linux-amd64.tar.gz"
      sha256 "a66e5c31e863dffc9f916bf3b61622bd2081754139d2ea806a217f569029df60"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
