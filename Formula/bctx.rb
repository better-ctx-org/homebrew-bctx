class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.30"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.30/bctx-0.1.30-aarch64-apple-darwin.tar.gz"
      sha256 "a60c17a5d615432c5d10fe36c8d099b085edb8fd46b9b6dbe7210e1abccf1ba3"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.30/bctx-0.1.30-x86_64-apple-darwin.tar.gz"
      sha256 "f28aa78ab604197c1592cf935f4debaad127f623d73740ab411cdb8793047703"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.30/bctx-0.1.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "256cb4df49423ffe3f4ea53a7a2a1bbf4f217ed8d1f22f37de9f3ab965abde15"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.30/bctx-0.1.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a879d938ce65b5a6e0c818bb889640530e8f1178832eeced2615fbd528c3658"
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
