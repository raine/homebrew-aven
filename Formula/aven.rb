class Aven < Formula
  desc "Local-first task manager CLI and sync server"
  homepage "https://github.com/raine/aven"
  version "0.1.47"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/aven/releases/download/v0.1.47/aven-darwin-arm64.tar.gz"
      sha256 "46da6acc8e7e1b054e4494726799ea94571b4d306424265199579ca87ad31406"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.47/aven-darwin-amd64.tar.gz"
      sha256 "ab951009a3395cf05926176bc92d9f5035190e09eb5929e54ca86313ddac9fa1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/aven/releases/download/v0.1.47/aven-linux-arm64.tar.gz"
      sha256 "be494c31279824206b60d15d396033c64866afcc966f48e15b9acb0f5fb63538"
    else
      url "https://github.com/raine/aven/releases/download/v0.1.47/aven-linux-amd64.tar.gz"
      sha256 "b5d643d1adefcf541fbebffd49ec5289ecd4964e540f6d93cb112603e9eb576d"
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
