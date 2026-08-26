class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.34/aven-darwin-arm64.tar.gz"
      sha256 "945c221bd9a4e288f26a0bb1140bfc5c0ed74c9e562b2fe3b659a5386bc440f7"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.34/aven-darwin-amd64.tar.gz"
      sha256 "d833a5855445ab9f069663cf674635970123052a45ba0a9fd2063a7e010d9f51"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.34/aven-linux-arm64.tar.gz"
      sha256 "d5a3ed2e4b551cc486594e0165a0c1ff25d88aaf3f48b717a5144cf2252706e4"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.34/aven-linux-amd64.tar.gz"
      sha256 "b1b8723b1fdefa33391fc63244a4c30628c1eb2e16760a692324f39c712c2543"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
