class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.45/aven-darwin-arm64.tar.gz"
      sha256 "b423e105cca4f13fdb9012b9c1a8f1fef30b15ab5580c318dbb587eba66b5e9c"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.45/aven-darwin-amd64.tar.gz"
      sha256 "ec2c6b0990c60a8097a0dd121f8983fab8d4f162c0a1e4509d37ddeff21806c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.45/aven-linux-arm64.tar.gz"
      sha256 "da78c25a8ad77918c3c7f95e2bdbd1ddff3c4101b97f31adcb2487f713764833"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.45/aven-linux-amd64.tar.gz"
      sha256 "b07c6a29f1c3f09afe20931352dd41183ff028456937ccb21d13fc80567bab9d"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
