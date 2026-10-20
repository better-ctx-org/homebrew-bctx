class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.39"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.39/bctx-0.1.39-aarch64-apple-darwin.tar.gz"
      sha256 "d38a0acf32d76ee457ccd8b6cfb9ebe79d82d408a16dfbd171e0b3f34e617096"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.39/bctx-0.1.39-x86_64-apple-darwin.tar.gz"
      sha256 "72aead9276ffec2c3350d50168f8e18abf3efe9457fde44d846cc14637ec8298"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.39/bctx-0.1.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "afc6bf00a0ead7a2663794d61c73e95a8ba975d98a238278f87dad7d05602060"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.39/bctx-0.1.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a2b092f30d5194c1f820c0da1cce81c1b33f892b07fdf1e58ef5357fee13c87"
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
