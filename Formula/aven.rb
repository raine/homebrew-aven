class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.38/aven-darwin-arm64.tar.gz"
      sha256 "676e46966cf389cfb8696649da0202f8c319b876fe8d79a0b18e48ac919b64b4"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.38/aven-darwin-amd64.tar.gz"
      sha256 "7c92741b644e8cb5399cbe23943b6fd914f7a75cbcb09ba8c04a2002a52fc09f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.38/aven-linux-arm64.tar.gz"
      sha256 "9847a8ba7170516d494f0211b9d1523437b8fd1d56c575e22b258428a1135d83"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.38/aven-linux-amd64.tar.gz"
      sha256 "fcadce6e6704085d586a5966741d78e731b2de9b9b13f4b3044b552d1caf5734"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
