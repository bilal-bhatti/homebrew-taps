# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Zipline < Formula
  desc ""
  homepage ""
  version "0.3.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-bhatti/zipline/releases/download/v0.3.3/zipline_0.3.3_Darwin_arm64.tar.gz"
      sha256 "d93db4bac78c0aff8ee268ccfdbda897b5ba657778d0d9510233e0d76eee648f"

      def install
        bin.install "zipline"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/zipline/releases/download/v0.3.3/zipline_0.3.3_Darwin_x86_64.tar.gz"
      sha256 "93ec1d9af494a9f71add9caea798db3d89f50f9ac176a6c2cffe264e2de24555"

      def install
        bin.install "zipline"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bilal-bhatti/zipline/releases/download/v0.3.3/zipline_0.3.3_Linux_arm64.tar.gz"
      sha256 "1aeb8bc441824d62afa675c3748eb3906d2f8b92322e36c7ee2d8d13e45145ed"

      def install
        bin.install "zipline"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/zipline/releases/download/v0.3.3/zipline_0.3.3_Linux_x86_64.tar.gz"
      sha256 "b64b9117a3b6453ec3c9b400e7dd956549e8dec3cb4fb41498545d38c1d7309f"

      def install
        bin.install "zipline"
      end
    end
  end
end
