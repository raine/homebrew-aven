class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.9/aven-darwin-arm64.tar.gz"
      sha256 "622bc5d06f72ab4df64081e5d1220fbf6a5c64316cfa42a02c40c9d0a195464c"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.9/aven-darwin-amd64.tar.gz"
      sha256 "d614e1bc712d1ccd024e26a4483b5d7664325f8ba76b0bdc6c368fa6f957854c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.9/aven-linux-arm64.tar.gz"
      sha256 "61f14e5383ba7e0fe394dad2e7147b41e3d2a3b8ef9a1910c8af88554abf7a62"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.9/aven-linux-amd64.tar.gz"
      sha256 "e4e0cb0d10d176c99c058cdca31c89a1b8b6447134625956f926a29d13b16c54"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
