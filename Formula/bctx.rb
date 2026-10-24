class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.45"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.45/bctx-0.1.45-aarch64-apple-darwin.tar.gz"
      sha256 "0d476b0228dd0769c153b45b13cc36880b2183f1ad7b16362fd295c3b95a1967"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.45/bctx-0.1.45-x86_64-apple-darwin.tar.gz"
      sha256 "fa58b58e13cf8dbe94ccedc127eff06f481aa87ee2d94fe7e605e5b71a121941"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.45/bctx-0.1.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e1276dfff95d3a96cfffaf93060a362f34343e8f1a7f57186b86b027b35c4373"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.45/bctx-0.1.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f5f25466c33e198bb9c814dc29a0f5c9661e6288e85e3ccb8a4b6edd29410f26"
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
