class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.47"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.47/bctx-0.1.47-aarch64-apple-darwin.tar.gz"
      sha256 "10066bc06ef77d45647f146c493c6ea0c9b00600aebc83275c75058027bf44be"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.47/bctx-0.1.47-x86_64-apple-darwin.tar.gz"
      sha256 "d8b69a6481f89e7a6fca0e1e7d9679f98ac1dd532aa5fa7339dbd773aa08fb8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.47/bctx-0.1.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62d9dfca58f984a867f31a56229f0892bb6be2171282eb2fe78379797a9dcc16"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.47/bctx-0.1.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7a21822c81aeeae89510aade2bdd9dbfe364f335cd18900eead568a0e9d92ab3"
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
