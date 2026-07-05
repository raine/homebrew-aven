class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.2/aven-darwin-arm64.tar.gz"
      sha256 "326124decd0249f36dbafe4f7f884685bfa59815cda88b5f4b151f04e1a92c18"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.2/aven-darwin-amd64.tar.gz"
      sha256 "8f784a128f57b65486e07a22af600b7abbe16bf4ada2deb21548e14c8e6429ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.2/aven-linux-arm64.tar.gz"
      sha256 "9e33ccaf65f195087e7e98d8447705f0652c3cf7605b883a32b3ef5b994ede95"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.2/aven-linux-amd64.tar.gz"
      sha256 "c51069c2607c33fc99894ce765d34f43b2755a7b5db373a47935a56a77053005"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
