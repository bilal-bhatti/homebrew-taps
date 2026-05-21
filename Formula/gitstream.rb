class Gitstream < Formula
  desc "Real-time git diff watcher — scrolling diffs ordered by file mtime"
  homepage "https://github.com/bilal-bhatti/gitstream"
  version "0.1.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bilal-bhatti/gitstream/releases/download/v0.1.6/gitstream-aarch64-apple-darwin.tar.xz"
      sha256 "115e5d80ab42a204c597946f3d112dd7378170a8dd1ad6571a7d921af88fd0e2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/gitstream/releases/download/v0.1.6/gitstream-x86_64-apple-darwin.tar.xz"
      sha256 "8e4b28c1568f1cc5d820572ef6556127e6fd30a330ec5178c1b5a739cc2baa2c"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bilal-bhatti/gitstream/releases/download/v0.1.6/gitstream-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "cc02f9da9d09904608d47fdd24911b1507095086f49cbf7b68ed71e54e4eeea6"
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
