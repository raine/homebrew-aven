class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.44/aven-darwin-arm64.tar.gz"
      sha256 "e98a4208d0ce5f25325d048d09b8592b0a32e4fb1e569b725decb60e396a997d"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.44/aven-darwin-amd64.tar.gz"
      sha256 "c7ecd94957af7eafd61df04fe8efdada14cdef22e08d09967fd96fb9d2dd7838"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.44/aven-linux-arm64.tar.gz"
      sha256 "17ad506fbef4b318fc3a2113373f5e916f2fe0d3aaffe0d2837b48c7b21e7bb4"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.44/aven-linux-amd64.tar.gz"
      sha256 "756370b00ac2d24e1832183857d7f3116a67fbbb4ed6102503bc324b3bf17e97"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
