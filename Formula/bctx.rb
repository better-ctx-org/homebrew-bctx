class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://bctx.dev"
  url "https://github.com/better-ctx-org/better-ctx/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER"
  version "0.1.0"
  license "MIT"
  head "https://github.com/better-ctx-org/better-ctx.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install",
           "--path", "bins/bctx",
           "--root", prefix,
           "--no-default-features",
           "--locked"
    # cargo install places the binary under prefix/bin/
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bctx --version")
    system bin/"bctx", "doctor"
  end
end
