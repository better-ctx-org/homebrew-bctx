class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.30"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.30/bctx-0.1.30-aarch64-apple-darwin.tar.gz"
      sha256 "77fab28cf0edfbbeeb903320161fa5db5229654ba5d860e2c91826e3ad5fa977"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.30/bctx-0.1.30-x86_64-apple-darwin.tar.gz"
      sha256 "f54b8c6deb6d182d66efce1ce466cd37f93abc5e2c4413724b691979ac7fa464"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.30/bctx-0.1.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c6cbfb8a1f314c44855e8ba3e356422cb7c10a197418f80bd1ceb91706c1983b"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.30/bctx-0.1.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3070c02d0fc1ca3c1f2174562d1a9e6bca700736fc5d60fa814d1af0294e474"
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
