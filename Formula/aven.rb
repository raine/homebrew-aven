class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.41/aven-darwin-arm64.tar.gz"
      sha256 "8fee5967e91164cd6d904b00832466156fd2f3abd7068230b28ab77ae36681ea"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.41/aven-darwin-amd64.tar.gz"
      sha256 "e42903ccea06295c050f3726bd7f6105a3ed5ca09a947d9aaf63eeeac5e00369"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.41/aven-linux-arm64.tar.gz"
      sha256 "a18e0aa7825a85ff25b282e2e96d7afef83b2cb5c1861c9d5541a2dfd9cfed47"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.41/aven-linux-amd64.tar.gz"
      sha256 "783c33c44c36972492824e306534a6a710d60bc35b5e82aac53f8812848133f8"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
