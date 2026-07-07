class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.32"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.32/bctx-0.1.32-aarch64-apple-darwin.tar.gz"
      sha256 "376565881dbccc028b25a4ac4b3eb257caccc3ad986db6c6c1b82055d3211572"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.32/bctx-0.1.32-x86_64-apple-darwin.tar.gz"
      sha256 "c1af62d99deb0eb614920208e879cd7e8a524aa760f0b96b51c7b488f98bcbbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.32/bctx-0.1.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec3e578d346154d0913af3deaf1b56f507fd10bc188c8c0f62969d6ab51e490f"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.32/bctx-0.1.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77df5c153b33d5aa8f0306f4931db2b60fd9b7df35ab93afad050e0804298cb3"
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
