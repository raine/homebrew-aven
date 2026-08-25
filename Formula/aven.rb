class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.33/aven-darwin-arm64.tar.gz"
      sha256 "794005f75234f50c64f5bdc3a0d04ecd7421d308012750635555e919d656ac33"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.33/aven-darwin-amd64.tar.gz"
      sha256 "219b0bdb096614db50c1bd26d30791751f156f18021d6c24a60653ea19e952e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.33/aven-linux-arm64.tar.gz"
      sha256 "d99e9f9d2ff8f983f315ae4225d90c63faa9543144c0d36914534c053c05ee7e"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.33/aven-linux-amd64.tar.gz"
      sha256 "93ae259dd0115fd42c43761097ffc405e8da17a214cf9c9e8861b0c662b9cfa6"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
