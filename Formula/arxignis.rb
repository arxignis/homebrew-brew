# typed: false
# frozen_string_literal: true

class Arxignis < Formula
  desc "Headless AppSec Security platform"
  homepage "https://arxignis.com"
  version "0.0.2"
  license "Apache-2.0"
  url "https://github.com/arxignis/cli/releases/download/v0.0.2/ax.darwin-arm64.tar.gz"
  sha256 "d395aa4fbb28f7ad79a889e8447bb6bde36c499879220d75be67a1adb2e1739e"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/arxignis/cli/releases/download/v0.0.2/ax.darwin-arm64.tar.gz"
      sha256 "d395aa4fbb28f7ad79a889e8447bb6bde36c499879220d75be67a1adb2e1739e"
    end
    on_intel do
      url "https://github.com/arxignis/cli/releases/download/v0.0.2/ax.darwin-amd64.tar.gz"
      sha256 "30ea5d214b14c05ab7bef1b923a671c7d6d7479c88df1f55f06ee625c72015aa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/arxignis/cli/releases/download/v0.0.2/ax.linux-amd64.tar.gz"
      sha256 "5c53f14dca5403587aa26c1c563523183a164906a4cf7774d3ba87123ae1c8ce"
    end
    on_arm do
      url "https://github.com/arxignis/cli/releases/download/v0.0.2/ax.linux-arm64.tar.gz"
      sha256 "dc6d605a102f9dc3e480adfeb525cce708f389b9cff527e5bef0c582b16c9a7c"
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
