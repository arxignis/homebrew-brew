# typed: false
# frozen_string_literal: true

class Arxignis < Formula
  desc "Headless AppSec Security platform"
  homepage "https://arxignis.com"
  version "0.1.1"
  license "Apache-2.0"
  url "https://github.com/arxignis/cli/releases/download/v0.1.1/ax.darwin-arm64.tar.gz"
  sha256 "7a7681aa9e96a02952fc42229332e228ab1732bb83bfd578ee21e4541e81fbbd"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/arxignis/cli/releases/download/v0.1.1/ax.darwin-arm64.tar.gz"
      sha256 "7a7681aa9e96a02952fc42229332e228ab1732bb83bfd578ee21e4541e81fbbd"
    end
    on_intel do
      url "https://github.com/arxignis/cli/releases/download/v0.1.1/ax.darwin-amd64.tar.gz"
      sha256 "988b49c39aaaf538011390aff35263839cd4c1d13fedad309c20b5bfcb808000"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/arxignis/cli/releases/download/v0.1.1/ax.linux-amd64.tar.gz"
      sha256 "ca22ae2b78acfd0d02d19919cecfd1efa8e3c7b26048573520f5a9d43af11dc9"
    end
    on_arm do
      url "https://github.com/arxignis/cli/releases/download/v0.1.1/ax.linux-arm64.tar.gz"
      sha256 "844e740d632255532a8b3cfbe6d25fddf1e8f82edbf298c6d6203765bc4717ba"
    end
  end

  def install
    libexec.install Dir["*"]
    if OS.mac? && Hardware::CPU.arm?
      bin.install_symlink libexec/"ax-darwin-arm64" => "ax"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install_symlink libexec/"ax-darwin-amd64" => "ax"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install_symlink libexec/"ax-linux-amd64" => "ax"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install_symlink libexec/"ax-linux-arm64" => "ax"
    end
  end

  def caveats
    <<~EOS
      Arxignis CLI is installed at #{bin}/ax.
      To get started, run:
        ax --help

      For more information, visit:
        https://arxignis.com
    EOS
  end

  test do
    system bin/"ax", "--version"
  end
end
