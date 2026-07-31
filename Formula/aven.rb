class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.20/aven-darwin-arm64.tar.gz"
      sha256 "125327d572d305cba628d9c4c760ab14c69c24159c83aba796781c5f27313ba2"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.20/aven-darwin-amd64.tar.gz"
      sha256 "5524a537b9714587bec074857cd44e0bf34d1e10e84961421078a55b927433a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.20/aven-linux-arm64.tar.gz"
      sha256 "2a25356251e10387475b9852102f3fbf99903a1e803d8b99d96e4627c7335a48"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.20/aven-linux-amd64.tar.gz"
      sha256 "16924bee5c799dc9a3ce82a7e388d0838727803ceff2f486bb8e2ae91e0a8848"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
