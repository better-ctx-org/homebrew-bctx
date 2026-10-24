class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.44"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.44/bctx-0.1.44-aarch64-apple-darwin.tar.gz"
      sha256 "5c235972a5d87b2a9878a1ebedf22af4094bd4df370dc76afff2bc9d4e97891a"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.44/bctx-0.1.44-x86_64-apple-darwin.tar.gz"
      sha256 "cf1b8555843078eb9ea98369feefaca30163c37557d3ec1cc845f229f555b8bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.44/bctx-0.1.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "69e7284c7912e9ad260915dd5b6832cd644737d7e85a341c223ed9ee0a3ced46"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.44/bctx-0.1.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf5adf57264bd8dde672551886c6e9e0f7b4491bc1d6f3f94c33b2977a463b82"
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
