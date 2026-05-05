class Gitstream < Formula
  desc "Real-time git diff watcher — scrolling diffs ordered by file mtime"
  homepage "https://github.com/bilal-bhatti/gitstream"
  version "0.1.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bilal-bhatti/gitstream/releases/download/v0.1.3/gitstream-aarch64-apple-darwin.tar.xz"
      sha256 "901aeb56caaf21e0fedb9a2c04210da9bb92373e515415eea1401129a6e51ba3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/gitstream/releases/download/v0.1.3/gitstream-x86_64-apple-darwin.tar.xz"
      sha256 "2004923969e71f15d84a251a0b14e360c1180607dd595ac501a44a8b4cc6afc8"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bilal-bhatti/gitstream/releases/download/v0.1.3/gitstream-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "ab2aa015b7f2fcafdce24e7b3650771ee16dd9706fdaa047a0dafbcb59d45b21"
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
    bin.install "gitstream" if OS.mac? && Hardware::CPU.arm?
    bin.install "gitstream" if OS.mac? && Hardware::CPU.intel?
    bin.install "gitstream" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
