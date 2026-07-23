class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.15/aven-darwin-arm64.tar.gz"
      sha256 "a521da57023722dd638d536e5d6e69b2d1dc60968e79a120a01be72d88208bad"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.15/aven-darwin-amd64.tar.gz"
      sha256 "8c539d1cd1308642cd68be0159d26e58689d5877b6452890334a02ef6fb7bab8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.15/aven-linux-arm64.tar.gz"
      sha256 "ee8279cbcd139b78553cb2c39a45138e20ddf70c258311a7a62d2138e523f8c3"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.15/aven-linux-amd64.tar.gz"
      sha256 "f1de83a2182829f1b48791ef40bfa4d4d984da3915e781700a6eba7c7f5f7cf8"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
