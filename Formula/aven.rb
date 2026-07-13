class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.6/aven-darwin-arm64.tar.gz"
      sha256 "79da1daed65c392026e4ca34ad0c2f9b8f30ffdc62eeedd89f7fb29fea620d01"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.6/aven-darwin-amd64.tar.gz"
      sha256 "f51c39f7048c13af243505d7647d2e8a087fc0ef0f4987b32bfd3730d42e45ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.6/aven-linux-arm64.tar.gz"
      sha256 "0c02f5f7d1958ff1a7a5f18ac9d32f2fe61c4415d0db3836bbaebe63acc00f3b"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.6/aven-linux-amd64.tar.gz"
      sha256 "05fd624f180fefdee2e4cecc0cfd5f08393a6ec069e229282dcaaec4271ed964"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
