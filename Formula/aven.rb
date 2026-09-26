class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.43/aven-darwin-arm64.tar.gz"
      sha256 "af5b5da4c2c11d6d1f50e497fe865ea4c075369aa6c63c003018787a137cb71f"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.43/aven-darwin-amd64.tar.gz"
      sha256 "f9aaeb6730a2f7bd660d79510154e2ba73fe0244e79e3cf745c906460022f9f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.43/aven-linux-arm64.tar.gz"
      sha256 "53b920c9da305ec3ef611a0f008ebaeb3877ae681fdb9c9b171f5a9e1e01419f"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.43/aven-linux-amd64.tar.gz"
      sha256 "8ac8d65fad3bc40ad543c3527ec7099fd5cd45cefa93741f7c46865103ecf8ed"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
