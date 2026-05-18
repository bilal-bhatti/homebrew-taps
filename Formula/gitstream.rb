class Gitstream < Formula
  desc "Real-time git diff watcher — scrolling diffs ordered by file mtime"
  homepage "https://github.com/bilal-bhatti/gitstream"
  version "0.1.5"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bilal-bhatti/gitstream/releases/download/v0.1.5/gitstream-aarch64-apple-darwin.tar.xz"
      sha256 "bfd04b467d62bc11c8470cf2ae8c2145e19f1f3f019414970a936f0da3c317c7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/gitstream/releases/download/v0.1.5/gitstream-x86_64-apple-darwin.tar.xz"
      sha256 "be8ffc32a6ad4221c42912159806bc87a7139d4a4f1f066fcb2420f347720044"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bilal-bhatti/gitstream/releases/download/v0.1.5/gitstream-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "f7878d4365c4c7b907efa93b5dce718e019c6b9e7186129f771582f0c6aa859a"
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
