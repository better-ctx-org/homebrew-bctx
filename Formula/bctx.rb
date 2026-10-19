class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.34"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.34/bctx-0.1.34-aarch64-apple-darwin.tar.gz"
      sha256 "f7138f1ec5e86989fe0db7b44ca2836e0b6e8a6849441dfee47f5b91884d2551"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.34/bctx-0.1.34-x86_64-apple-darwin.tar.gz"
      sha256 "e9b0ade5a97cd9d515e22cc92375bbeab6020b28321661f78cc4c56d818461b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.34/bctx-0.1.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a2ccc0f15a7a31ba918441e92ed7cc14ffd7f47d85a80602744320b60b3d651f"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.34/bctx-0.1.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "73957e7b78023fc7355a56c1d650c589b473ebc7363505de20ec9ccd71ec5fbd"
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
