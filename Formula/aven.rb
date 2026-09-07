class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.37/aven-darwin-arm64.tar.gz"
      sha256 "8087cd6e5f8adf0a170aa24f91a55828be32803408bdf95456ceb6e04659cbfa"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.37/aven-darwin-amd64.tar.gz"
      sha256 "ce3885a0e81cae36024c31a4f71e378dc721388f805ec1fa8f8264a54e224b24"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.37/aven-linux-arm64.tar.gz"
      sha256 "24b2f861044cf477544454a6640bd2f7db14e4cce30c0739fa7fad50d5e7fc8b"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.37/aven-linux-amd64.tar.gz"
      sha256 "d33aa952ead5186a1d272638a42402f9e27519246230debbba35a3e049f7d6f6"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
