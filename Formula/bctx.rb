class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.28"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.28/bctx-0.1.28-aarch64-apple-darwin.tar.gz"
      sha256 "208b329d3489a9430828fab104fde822e503e04dc4ffb01df66117ebb8be0d8f"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.28/bctx-0.1.28-x86_64-apple-darwin.tar.gz"
      sha256 "c10382f3a01722a1fcb760c170d8fc7f91105f4df4f3fb70e679d2512606ef56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.28/bctx-0.1.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4a3251f8ad544f47e8f5e717ce731af8d0812a89c38756c418822a5d3db44f17"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.28/bctx-0.1.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e0d4e91c482cfadd44226b48166788b3f019876ea542a6b7a7567926df58a73b"
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
