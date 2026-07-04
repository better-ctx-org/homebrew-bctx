class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.31"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.31/bctx-0.1.31-aarch64-apple-darwin.tar.gz"
      sha256 "4774d7583e6ee1aa352622ab777389a8a6311b6f87fd7bdd8adbed4be1449c14"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.31/bctx-0.1.31-x86_64-apple-darwin.tar.gz"
      sha256 "b66c579724fb3105bb80d38b2c45c0ca363455b92a4ee27c096cf0023695496d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.31/bctx-0.1.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f6353be723a683384b5a367b231e35c9d75b2ad3de8c08d623b16dc528c83f31"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.31/bctx-0.1.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09701ad597c1aba61c57146f1aa263e4db418a69bfb7d657e36b437e9aa946d9"
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
