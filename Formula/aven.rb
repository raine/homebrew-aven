class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.42/aven-darwin-arm64.tar.gz"
      sha256 "af5f20e455ba28cd05231ec36cb7e7c2dcd8c489666151461ffcb74fbc7c3a66"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.42/aven-darwin-amd64.tar.gz"
      sha256 "bd31bbd0dfc2ff126b77d6ff2dfa4db5fd713ae553d5f23862da88bf3892906d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.42/aven-linux-arm64.tar.gz"
      sha256 "03a7b79eee6b66d0a5bc4ad05be15ea52555d373ed5709a7f61eb27371fffc90"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.42/aven-linux-amd64.tar.gz"
      sha256 "dc9d92622558ee9e90d57e3fe6ec44e54b44911ed782c1cfd09e806075c32236"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
