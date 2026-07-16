class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.11/aven-darwin-arm64.tar.gz"
      sha256 "bad99101a0167224c591e4ca7f915554e5bcea059a02e1f474dfec38d1ea0dae"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.11/aven-darwin-amd64.tar.gz"
      sha256 "a51d33bcbc4f36f97fe579d3348b1d1fac026ba211c1ee1c8b72601b416251df"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.11/aven-linux-arm64.tar.gz"
      sha256 "a003174df421e8b4229da892bc3c1a284a94ae9d2868eafa8e5e6d3c1740509c"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.11/aven-linux-amd64.tar.gz"
      sha256 "3260ad286be9fd2e4d4dd6528e37d86ccc24858ee45b2742c7d66d96297626b0"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
