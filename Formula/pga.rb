class Pga < Formula
  desc "Terminal UI for PostgreSQL roles, databases and privileges"
  homepage "https://github.com/bilal-bhatti/pga"
  version "0.1.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bilal-bhatti/pga/releases/download/v0.1.2/pga-aarch64-apple-darwin.tar.xz"
      sha256 "4df63437f682dbb4ace6b81577f4269c027fa8fcbd8534725316776dbd129ee3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/pga/releases/download/v0.1.2/pga-x86_64-apple-darwin.tar.xz"
      sha256 "f8486f698a2de1002cfc80180877beb711b1f0ba6440d2b194c82592d183d32d"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bilal-bhatti/pga/releases/download/v0.1.2/pga-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "fb9fdec7df8f460591828c2785be155c537ed5597c3bdd30618f9068b6f4ba93"
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
