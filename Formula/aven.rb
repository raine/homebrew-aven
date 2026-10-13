class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.49"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.49/aven-darwin-arm64.tar.gz"
      sha256 "322f2fae463a0dd240e6a2379e1a8f7c6cfd02ecc2d0db26917fa55a34d13a80"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.49/aven-darwin-amd64.tar.gz"
      sha256 "2813d00548f817317a5e58ab9fd9f0e094aad2c86b0c85d201e4e8be33b8084d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.49/aven-linux-arm64.tar.gz"
      sha256 "281f709140828b887a3e6b3f99d5468502e67b279e8e88e4ca99f81008f4f903"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.49/aven-linux-amd64.tar.gz"
      sha256 "8c400a07802619645a9e7ea8843978242ef2b7be73605712ec00b8162f4cfd69"
    end
  end

  def install
    bin.install "aven"
    generate_completions_from_executable(bin/"aven", "completions")
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
