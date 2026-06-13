class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.29"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.29/bctx-0.1.29-aarch64-apple-darwin.tar.gz"
      sha256 "539ee125685ca3d61391ad3ae8497c6565a6cc29849894beb6fbadf2ac24b4ec"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.29/bctx-0.1.29-x86_64-apple-darwin.tar.gz"
      sha256 "9f73392fc184aae19ab83dfa919ff0f3035e53a8b3e1b54125654e2b101c61b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.29/bctx-0.1.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6db62ce98f3fca5a7f7a25cfe30d859d333c8689f33499397873ec7405299333"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.29/bctx-0.1.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b1445ebd923a6782edb2bd9fccb9870e0453e897a223cc246d7ca4d0441ca1b"
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
