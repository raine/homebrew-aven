class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.32/aven-darwin-arm64.tar.gz"
      sha256 "f7d84d1dd58efd92405ecc13099d1a0a1431c5d8e5c930d3df59fdf7a5b66d63"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.32/aven-darwin-amd64.tar.gz"
      sha256 "4d9c6ad6ee577d426b29ffe4e71481b43c64e14b3c9a2b1a5feeb14352b85565"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.32/aven-linux-arm64.tar.gz"
      sha256 "62a6ddbdff66800c1b123d988e498c3e95ff89be551630a87788f07eb13349dc"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.32/aven-linux-amd64.tar.gz"
      sha256 "2a120e2297c5be66f9b4b45103d5ccdfe5546cbc042210583c97b735b107944d"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
