class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.37"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.37/bctx-0.1.37-aarch64-apple-darwin.tar.gz"
      sha256 "5433a28f5a79e82a24462e44780390f9914d226475755673905c465f276742f3"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.37/bctx-0.1.37-x86_64-apple-darwin.tar.gz"
      sha256 "8556d7061c943f7f2ee13e3b06b7fe2bda103e94d9a12c824cc3509f1476d44e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.37/bctx-0.1.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9748cc2b77600717649204732ba174124c71e9ba8c34ecbd8789f41ff8b32aa4"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.37/bctx-0.1.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7d9d95a6f95c80178bf9437e912060d926604227fba8b91b0603073811ffd7f4"
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
