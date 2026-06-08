class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.27"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.27/bctx-0.1.27-aarch64-apple-darwin.tar.gz"
      sha256 "d01e6d8106be6a3da20f0be776cb3019cc844ae14954fe80e9a409e39d24ac42"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.27/bctx-0.1.27-x86_64-apple-darwin.tar.gz"
      sha256 "22707513934e0cbd53a897abac36035e05fc8602a3faf8217f62b0ebf22e91e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.27/bctx-0.1.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "455ee0003a7a5eb72e12d7cfc2e1fff117b67cc4d88cd1c4545c6ec0229aa8fd"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.27/bctx-0.1.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a9e4ce2b54773c70838946f237a4b02b5487ba7f5c06b3365e57160ec067661"
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
