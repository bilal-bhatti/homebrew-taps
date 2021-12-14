# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Jt < Formula
  desc ""
  homepage ""
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-bhatti/jt/releases/download/v0.1.4/jt_0.1.4_Darwin_arm64.tar.gz"
      sha256 "6cec98a71c7877255c40266fa5dcecc5ca877bfff043f41372b112c5942bcdaa"

      def install
        bin.install "jt"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/jt/releases/download/v0.1.4/jt_0.1.4_Darwin_x86_64.tar.gz"
      sha256 "a230b3aa2e254883f6fa212c1d058e6d1518f57166e1ef8cf1e89e5b7126dfac"

      def install
        bin.install "jt"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bilal-bhatti/jt/releases/download/v0.1.4/jt_0.1.4_Linux_arm64.tar.gz"
      sha256 "f126cb0870a91d4740dd208ae7a1277f54a76f050559d7b38dec44a69f79ffd3"

      def install
        bin.install "jt"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/jt/releases/download/v0.1.4/jt_0.1.4_Linux_x86_64.tar.gz"
      sha256 "e3c7875ed2bff782cee51ed8ecf147b68fe8d424da3f49245481151c1f104fa3"

      def install
        bin.install "jt"
      end
    end
  end
end
