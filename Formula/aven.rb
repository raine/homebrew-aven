class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.1/aven-darwin-arm64.tar.gz"
      sha256 "b1f5e01dd059bfeb6e58587f40a1a7e4472531904b3094489db3bec0cd151a0a"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.1/aven-darwin-amd64.tar.gz"
      sha256 "ce88c4110e80284edadc390e77da452c1235889465658f8d7de589412d9c080d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.1/aven-linux-arm64.tar.gz"
      sha256 "fd50fb41098f10a6486469162865a2061ff1fbb004d6f277b0d24e30863826af"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.1/aven-linux-amd64.tar.gz"
      sha256 "c24246bbafe2239a84f6c4f5aec379dea238df91602d8c4a85c5457bf1df24ad"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
