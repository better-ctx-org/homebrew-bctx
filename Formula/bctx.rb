class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.40"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.40/bctx-0.1.40-aarch64-apple-darwin.tar.gz"
      sha256 "24c1313dafbda4278ad6058868032547b41744e533957767174e6eb2e0ae2642"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.40/bctx-0.1.40-x86_64-apple-darwin.tar.gz"
      sha256 "c18e90e13abdd0924e68bd3c7e6128051b34ba7b1ba751e950ebb4b15b42b552"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.40/bctx-0.1.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4dd5dd54fa401917bbba76dc4f29bfa055de9d60add7d3517c949b71b1518d74"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.40/bctx-0.1.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6977564868869a896c62cbe6737c8cafcbab504ebbb43d9eb11bc7941bce46c5"
    end
  end

  def install
    bin.install "bctx"
    bin.install "bctx-cloud" if File.exist?("bctx-cloud")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bctx --version")
    system bin/"bctx", "doctor"
  end
end
