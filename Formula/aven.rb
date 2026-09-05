class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.36/aven-darwin-arm64.tar.gz"
      sha256 "e92fffd8fcbf7eaa4614efc916fd146f6ef2e7ecbf8b15833b0743080c710afd"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.36/aven-darwin-amd64.tar.gz"
      sha256 "54b61a8501fced237364bc9f75228469e31b8e7ec477af8b6f387ad85b76973b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.36/aven-linux-arm64.tar.gz"
      sha256 "af517f80fdfa74598efdcb4b00841b16aadb66f632ff92be0f6e3a1558ed4573"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.36/aven-linux-amd64.tar.gz"
      sha256 "e21deae58fa971761bb79832accecff78b56af114c3a024ec629652a35271014"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
