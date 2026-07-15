class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.7/aven-darwin-arm64.tar.gz"
      sha256 "98d31104b1f61dfa625fc29886b8ee31a8d599596f60f0e4418b38d13c8b700f"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.7/aven-darwin-amd64.tar.gz"
      sha256 "0a4117b4c02327a95f5fb543893b1f68d99fe49d521c3ba79582678e0750ee88"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.7/aven-linux-arm64.tar.gz"
      sha256 "12ca4354bfc6d4386cb5fe900e5b36a61aeb6816b78900e5084c8b720934c815"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.7/aven-linux-amd64.tar.gz"
      sha256 "816939a7beb63e53e0ed9ee857ed0ad6eb0c8e7359b3aabe3828f9f1d21a2054"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
