class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.33"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.33/bctx-0.1.33-aarch64-apple-darwin.tar.gz"
      sha256 "04ded7132adedbeb590451fb3503238ff507c1ae743fd37b0170036223ad6859"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.33/bctx-0.1.33-x86_64-apple-darwin.tar.gz"
      sha256 "885c62f8e640ed4ec8d8709a6ae65374c70133e8dd8f03a2795e34867b08c961"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.33/bctx-0.1.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ada54a6d68e010ae81d1b0105491e2753b9d4b4eea9c5b8a2c7710348ddad05b"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.33/bctx-0.1.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "595eb7131e30034beccc35d1a9f8ce403ade1f5761b22972a414a776ecbbdef5"
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
