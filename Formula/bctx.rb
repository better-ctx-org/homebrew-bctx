class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.24"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.24/bctx-0.1.24-aarch64-apple-darwin.tar.gz"
      sha256 "389566673ffdbd2702c9bd3d9a770dce7bf6f0969713276edd72f3fee95b2e87"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.24/bctx-0.1.24-x86_64-apple-darwin.tar.gz"
      sha256 "ff4d662912e03965329eaf15c2ed10a8074f9fe75240a2146a37d90816c7bfc0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.24/bctx-0.1.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "73e081b84807b34715dbf28a232b302890312918ca3590694329208ea209e5eb"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.24/bctx-0.1.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f26c1031a45e077aff6c5ecfb12338fcb4a8e5f2ed06865540984dd714b2117"
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
