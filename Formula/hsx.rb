class Hsx < Formula
  desc "Portable cross-shell history substring search (zsh-history-substring-search, but for zsh/bash/dash/ksh)"
  homepage "https://github.com/bilal-bhatti/hsx"
  version "0.1.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bilal-bhatti/hsx/releases/download/v0.1.2/hsx-aarch64-apple-darwin.tar.xz"
      sha256 "bb5f56bfb5e0085324a2f4aef790e8f86ee23cffd0afb47509d31780743006f0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/hsx/releases/download/v0.1.2/hsx-x86_64-apple-darwin.tar.xz"
      sha256 "8b1ae6b6045424228a1e3798437fdc6d3881946336816efa78b0e08c0526dd29"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bilal-bhatti/hsx/releases/download/v0.1.2/hsx-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "2b2f0b30782a17d5b5100be5b2067375eaae21d164c7aad90cb9da67e7b8de4c"
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
    if OS.mac? && Hardware::CPU.arm?
      bin.install "hsx"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "hsx"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "hsx"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
