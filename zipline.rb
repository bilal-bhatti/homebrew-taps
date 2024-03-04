# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Zipline < Formula
  desc ""
  homepage ""
  version "0.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-bhatti/zipline/releases/download/v0.5.1/zipline_Darwin_arm64.tar.gz"
      sha256 "157b20f334b6d330d6d9577319e179bf1dd811aa656781fa5c8b480a10156af7"

      def install
        bin.install "zipline"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/zipline/releases/download/v0.5.1/zipline_Darwin_x86_64.tar.gz"
      sha256 "34f2c88bb7df46acd2ad5cd15e9d19e4d84c53c82e889ef1027c6b09fbecd5e4"

      def install
        bin.install "zipline"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bilal-bhatti/zipline/releases/download/v0.5.1/zipline_Linux_arm64.tar.gz"
      sha256 "5e9b5b7f0bd3584faa46c248c25d5a7413b84037adb3d51f727848cae42b7b01"

      def install
        bin.install "zipline"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/zipline/releases/download/v0.5.1/zipline_Linux_x86_64.tar.gz"
      sha256 "4d152c7c087bbaffe88509f149a141023116e927d780761c5c2f14ccb41077f3"

      def install
        bin.install "zipline"
      end
    end
  end
end
