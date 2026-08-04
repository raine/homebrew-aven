class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.23/aven-darwin-arm64.tar.gz"
      sha256 "f9f246daf92c78fefb21f26faeadef94b2cb904b4cfe5befcffb023a3ae43cf8"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.23/aven-darwin-amd64.tar.gz"
      sha256 "154354d155c4188d073c1f2496f1841a98d3b80b58e7af40d6f4aa6881f0a4a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.23/aven-linux-arm64.tar.gz"
      sha256 "1b9567312a38c67d9441868a2407fb5e1906a4ebb15e94c4906a2df1f4b92bef"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.23/aven-linux-amd64.tar.gz"
      sha256 "4b248d96eff1a58afb14567be62c3d8dde6896a02c8be453576337c07b7713b8"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
