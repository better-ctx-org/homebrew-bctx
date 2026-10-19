class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.38"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.38/bctx-0.1.38-aarch64-apple-darwin.tar.gz"
      sha256 "955d9312c72a8ea89b5d0dba481934df2a692eab70f5e7c992ec7681eada867c"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.38/bctx-0.1.38-x86_64-apple-darwin.tar.gz"
      sha256 "e86573e7b27d2e7db5acdaaaa4c58387570429d72a01f337149d744725e3c501"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.38/bctx-0.1.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "04d40c1e12943af0939034f751900f2a339d8d75a36132d951ae2b082503fcdc"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.38/bctx-0.1.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3be444f5472209d7bfc4add3af8abe8960c52198e59fb4da99617ba3a4b84644"
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
