class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.46"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.46/bctx-0.1.46-aarch64-apple-darwin.tar.gz"
      sha256 "24d358ace49465684f729c9fb4b62a24ca1214fb8ceeed8de1bfa7cd566ae26c"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.46/bctx-0.1.46-x86_64-apple-darwin.tar.gz"
      sha256 "c29646ee9d97c08d791fe4fc32013e1728f10c21fbf038c13627223c29b8cd6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.46/bctx-0.1.46-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b627573e58263191f3ffd09a5255a8446d05d878ff39cfc215fd1ff02529dbf7"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.46/bctx-0.1.46-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "37b1de3d0092f56fd0037d2662bcee23435ec2a69f5a5138e6d87bd5f42f0084"
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
