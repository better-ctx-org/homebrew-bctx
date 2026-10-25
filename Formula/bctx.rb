class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.49"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.49/bctx-0.1.49-aarch64-apple-darwin.tar.gz"
      sha256 "c5555e6a554e69fd0b8a9293e09431b3734978862c826a4e4c10340031b7e58a"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.49/bctx-0.1.49-x86_64-apple-darwin.tar.gz"
      sha256 "9acf7ba0c9124b8ab6a6ea3f953e9bb7b84495875ad95df71a548822de5b7794"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.49/bctx-0.1.49-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fa3269bc0bf00be672096b22068ac8cfc7c1d24c667148397f48ec90fe6ebeac"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.49/bctx-0.1.49-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c767198fd2f43c4916032ce2488c640950b42cf2be110750eac9fc9b8600bd4"
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
