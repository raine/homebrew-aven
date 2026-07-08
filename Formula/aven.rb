class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.3/aven-darwin-arm64.tar.gz"
      sha256 "f51f611cba7eaf20ba820d52549200dff73df8996d603ceaa977fe05f4b66b2b"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.3/aven-darwin-amd64.tar.gz"
      sha256 "2327eb163cddeee91b8b5226f38525ebb22690b07d2e636c9dde2662871c6cd5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.3/aven-linux-arm64.tar.gz"
      sha256 "12d474232856b201e27464e6924393a02613bdae377d367cccfabbf2e2900123"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.3/aven-linux-amd64.tar.gz"
      sha256 "9d4014b712ef3e984173eb34b20f1e2891d62fd22399a62ac21f419013a55386"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
