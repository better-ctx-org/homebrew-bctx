class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.35"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.35/bctx-0.1.35-aarch64-apple-darwin.tar.gz"
      sha256 "672303ed07cf655fa5570567ece8ad72bbe03c91ef9e9c3178b82aa277b94c10"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.35/bctx-0.1.35-x86_64-apple-darwin.tar.gz"
      sha256 "b9ab9e99920b738475489724987de4cb9dc06457e509394b75f9d4c4094b2d8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.35/bctx-0.1.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf10b6d843802f5ca4aeae5287dbd0b14109d8a0d8323227e40ec903ac9f3f95"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.35/bctx-0.1.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db7e7d5f88d47bf06ee8d9a0804d7104b8860e544b681c4a695e681a77bc2b31"
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
