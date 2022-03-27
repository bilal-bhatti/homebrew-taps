# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Zipline < Formula
  desc ""
  homepage ""
  version "0.3.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-bhatti/zipline/releases/download/v0.3.4/zipline_0.3.4_Darwin_arm64.tar.gz"
      sha256 "2c2596da32af652b0c4452e00d646127723056a1b9eaba5631044138ac051ac2"

      def install
        bin.install "zipline"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/zipline/releases/download/v0.3.4/zipline_0.3.4_Darwin_x86_64.tar.gz"
      sha256 "61568cc23facd9d5efe5307568a6e72cbbfff20f414b1f8dc8a822d528416c08"

      def install
        bin.install "zipline"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bilal-bhatti/zipline/releases/download/v0.3.4/zipline_0.3.4_Linux_arm64.tar.gz"
      sha256 "194f5c34e200fe6b84c68929b6bad3a24cff0b950c81d75a7237e898b126897e"

      def install
        bin.install "zipline"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bilal-bhatti/zipline/releases/download/v0.3.4/zipline_0.3.4_Linux_x86_64.tar.gz"
      sha256 "8a9957e0ced86f4e9f1f75b4500a50826644770487e29fd8d2cedbb67b63abc2"

      def install
        bin.install "zipline"
      end
    end
  end
end
