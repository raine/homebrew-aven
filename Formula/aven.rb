class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.35/aven-darwin-arm64.tar.gz"
      sha256 "2721d49a225ea8d56c95b74ee0df2f18242b39029adf940e3db7f1f3074f0dc2"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.35/aven-darwin-amd64.tar.gz"
      sha256 "adc4158ba4aec64a73bf6e8e8f98a749a298d756c272aafc7e08740a29ba119e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.35/aven-linux-arm64.tar.gz"
      sha256 "9cee0dcd75a63a36f77ac18e50d204ca12b14c3d4a22415ff732f5a4261e4e4d"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.35/aven-linux-amd64.tar.gz"
      sha256 "3e0cf0e739167e638a9f74c651c065d964f823b4ac5f61dea2c2e40e5a6b16fa"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
