class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.13/aven-darwin-arm64.tar.gz"
      sha256 "9a7db28e505cbd7b7556ef8050903a3bb94713e92506b0747a7abe3800d966fe"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.13/aven-darwin-amd64.tar.gz"
      sha256 "a9fe93c35c5ad9da5e6dcdf1b73d8f00aca678043ea1915ecf101d3fe90e433d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.13/aven-linux-arm64.tar.gz"
      sha256 "35e0b885e8c7695a4b46f1c6ac34c8019381d40edabfe48e69b296f0758f4fc3"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.13/aven-linux-amd64.tar.gz"
      sha256 "4dc51d4f3a16b71bbd439351b42c192f6ba93d6251c1812e8665d00c6fb167b2"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
