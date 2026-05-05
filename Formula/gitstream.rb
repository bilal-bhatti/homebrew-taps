class Gitstream < Formula
  desc "Real-time git diff watcher — scrolling diffs ordered by file mtime"
  homepage "https://github.com/bilal-bhatti/gitstream"
  version "0.1.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bilal-bhatti/gitstream/releases/download/v0.1.4/gitstream-aarch64-apple-darwin.tar.xz"
      sha256 "ad2e9efbbffcfd8292b76fc70df9a655670ff5e36d96ce3307359f23e9400208"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/gitstream/releases/download/v0.1.4/gitstream-x86_64-apple-darwin.tar.xz"
      sha256 "9823a57f65622f1606787fb1a77a9f451ae9175643f852985a032d1f316b3539"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bilal-bhatti/gitstream/releases/download/v0.1.4/gitstream-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "50a3e4c42e81739e9da75a9e86ae80cbb601c1076623ba2f18b705ad918c9e0f"
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
