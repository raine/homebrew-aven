class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.16/aven-darwin-arm64.tar.gz"
      sha256 "947c491c9abfde54fbf9c240e233876f7cb460d5d2f3950af98a2a2cfa01b2ce"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.16/aven-darwin-amd64.tar.gz"
      sha256 "e9f4f8ae0ed9bc6b7a5830c1980656b1bc43e9b82f3cb6cacdda67a5196cc096"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.16/aven-linux-arm64.tar.gz"
      sha256 "d6f1c4112628f80ce2ef6a67b9f9441bc77189ea2073ad460fbc11ce4c852cc3"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.16/aven-linux-amd64.tar.gz"
      sha256 "75228b253db257e1d0ebd38d7e88b583470171123e0cc10864de6d9191037a6c"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
