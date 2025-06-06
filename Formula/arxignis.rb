# typed: false
# frozen_string_literal: true

class Arxignis < Formula
  desc "Headless AppSec Security platform"
  homepage "https://arxignis.com"
  version "0.0.1"
  license "Apache-2.0"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/arxignis/cli/releases/download/v0.0.1/ax.darwin-arm64.tar.gz"
      sha256 "d412126e7e15d911589e7e543a82c207b10b2fd9f6c22f28b7c0dfd182cde68c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/arxignis/cli/releases/download/v0.0.1/ax.linux-amd64.tar.gz"
      sha256 "c4ef698c4d82d0893b1d004df1205b5884ed32b80d9f7fe9482aa33025bf330f"
    end
    on_arm do
      url "https://github.com/arxignis/cli/releases/download/v0.0.1/ax.linux-arm64.tar.gz"
      sha256 "cf35751af4515254cd398197817a8c5c635b0a7d70946f7f6263cd15d8bd3ba8"
    end
  end

  def install
    libexec.install Dir["*"]
    if OS.mac? && Hardware::CPU.arm?
      bin.install_symlink libexec/"ax-darwin-arm64" => "ax"
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
