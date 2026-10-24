class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.43"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.43/bctx-0.1.43-aarch64-apple-darwin.tar.gz"
      sha256 "260a734327f71293cb57f992ea0c84692ab9edaf36d48ce019345edd7c15b0a7"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.43/bctx-0.1.43-x86_64-apple-darwin.tar.gz"
      sha256 "7da945fca8b6f10b0b81b6affa99ba2e6e4c7efd10b3005fb867a9152a077fd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.43/bctx-0.1.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e88175d746a14ba989e205f7d3fc8ca215d04e8919beced741d383d6dc65205"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.43/bctx-0.1.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8207b3eab794784e201f71e09115824c5ae98bc0a664b8d85b4dc0cc32acc2a9"
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
