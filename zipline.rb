# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Zipline < Formula
  desc ""
  homepage ""
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-bhatti/zipline/releases/download/v0.5.0/zipline_Darwin_arm64.tar.gz"
      sha256 "6cb6080ac2bb59117991e10b3d9eca2f563e16fad565a758f12f6dad124f98d1"

      def install
        bin.install "zipline"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/zipline/releases/download/v0.5.0/zipline_Darwin_x86_64.tar.gz"
      sha256 "c3d42bdc7446822107774d2c95b83b3d48ef0fabdbbb95edb0847f773501b984"

      def install
        bin.install "zipline"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bilal-bhatti/zipline/releases/download/v0.5.0/zipline_Linux_arm64.tar.gz"
      sha256 "879fe59787d8d13e6b5aa3701760a899ac30544008c97a1d4cb5cb6a3011ec3a"

      def install
        bin.install "zipline"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/zipline/releases/download/v0.5.0/zipline_Linux_x86_64.tar.gz"
      sha256 "f24634a822a7b0bfaa4fdfbb75b4615c4ce2fc55dc6aa867f4f86655e1d33ad2"

      def install
        bin.install "zipline"
      end
    end
  end
end
