class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.48"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.48/bctx-0.1.48-aarch64-apple-darwin.tar.gz"
      sha256 "fa4030a97186f5ab87deb68df66804fa09bb89a352aef147536da4b01fd1e641"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.48/bctx-0.1.48-x86_64-apple-darwin.tar.gz"
      sha256 "5484cf8303d5c29fc56ef2583be7151573133f251b756ed725152da9e166f4af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.48/bctx-0.1.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9668d6bf43567679004e33ea540f2960f77e86af442b83f15670f84a2bbf04ef"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.48/bctx-0.1.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a335c56b95a49294e6913002ee41b0864c6bc2bc4433941b62aa1d06a43769b6"
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
