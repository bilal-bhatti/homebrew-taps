class Hsx < Formula
  desc "Portable cross-shell history substring search (zsh-history-substring-search, but for zsh/bash/dash/ksh)"
  homepage "https://github.com/bilal-bhatti/hsx"
  version "0.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bilal-bhatti/hsx/releases/download/v0.1.1/hsx-aarch64-apple-darwin.tar.xz"
      sha256 "41ee609695cd0ffcafab4a9e2e89390c66cccbd49499a06902a17787bb76b72c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/hsx/releases/download/v0.1.1/hsx-x86_64-apple-darwin.tar.xz"
      sha256 "a2ef449469d7a6c6323bb14d5f82397cb6f9aa7f63a80992445ef240667a778e"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bilal-bhatti/hsx/releases/download/v0.1.1/hsx-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "b082ba4445319b602c483c654f03c04e1aff71881b840bacddb908c40f931b4c"
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-unknown-linux-gnu": {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "hsx" if OS.mac? && Hardware::CPU.arm?
    bin.install "hsx" if OS.mac? && Hardware::CPU.intel?
    bin.install "hsx" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
