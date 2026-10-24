class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.42"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.42/bctx-0.1.42-aarch64-apple-darwin.tar.gz"
      sha256 "60f0446e9f003f0ef92627a65ef36cc16b31fbd81fd7ed7defb6cad8d1ecb31a"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.42/bctx-0.1.42-x86_64-apple-darwin.tar.gz"
      sha256 "c08da111ada3ca926cb1a79be5e1d7779df61248641bbb992803f913f46fb7bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.42/bctx-0.1.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "751a134ad04fb864a00a5e42a95d2a4737fa71ab0c869f9a1885b51dd1d2aabe"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.42/bctx-0.1.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f49158453b4ea327b484d961c609dc1da406f04e2362f5658c76675b9d52fc4c"
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
