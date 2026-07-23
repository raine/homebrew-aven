class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.14/aven-darwin-arm64.tar.gz"
      sha256 "47f2cc441e94d06482f74f70e2221066ef7cc3690f8800426b5642c78dea6688"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.14/aven-darwin-amd64.tar.gz"
      sha256 "a1e6132facafbab9c0d2c8724b5bb179563669e3bd2572cbe5f85b328298e5fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.14/aven-linux-arm64.tar.gz"
      sha256 "61cc19de5b33b59e84200f059af5946d34d06b34978bc7fcb367c5f5c7f89135"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.14/aven-linux-amd64.tar.gz"
      sha256 "3bbb113e3b38c95800ec3b3943782c6d87d2ae73e3515687b748886929a31b8b"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
