class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.22/aven-darwin-arm64.tar.gz"
      sha256 "17611f0148f810b48408880da6563cef9f53e57a58be54daf2aa3baf9cd27d5b"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.22/aven-darwin-amd64.tar.gz"
      sha256 "4ad17712002909b027ed58795627537576199f1cdaea66c21cf147d809bdfaf2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.22/aven-linux-arm64.tar.gz"
      sha256 "52e53a965c5cf9d2bd0212ecf194ad1a1ff48cec88807ada4b6ac860aa70f950"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.22/aven-linux-amd64.tar.gz"
      sha256 "342cc2e22893ddb4fb9ca0021afdb082d69048099432b974af2c1dc197d32552"
    end
  end

  def install
    bin.install "aven"
  end

  test do
    assert_match "Local-first task manager", shell_output("#{bin}/aven --help")
  end
end
