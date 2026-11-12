class Pga < Formula
  desc "Terminal UI for PostgreSQL roles, databases and privileges"
  homepage "https://github.com/bilal-bhatti/pga"
  version "0.1.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bilal-bhatti/pga/releases/download/v0.1.3/pga-aarch64-apple-darwin.tar.xz"
      sha256 "d6197010fdc5703bf0cf968c40bf898df6b761c036bfdcc32c3b66e2b28cadb7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/pga/releases/download/v0.1.3/pga-x86_64-apple-darwin.tar.xz"
      sha256 "c94ad65717edc51dfd6b4a6647b27b17cf418606ab47920a517df07abecaaefe"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bilal-bhatti/pga/releases/download/v0.1.3/pga-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "c1748e99f6120254cf79b521a6328cb84098e9f090253e831ddf65d1929b908c"
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
      bin.install "pga"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "pga"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "pga"
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
