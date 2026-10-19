class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.36"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.36/bctx-0.1.36-aarch64-apple-darwin.tar.gz"
      sha256 "ccf127b3b09ceb091cb840b54e3145546cad04550153df2a276ff0d9c99e3d9f"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.36/bctx-0.1.36-x86_64-apple-darwin.tar.gz"
      sha256 "67e65741e42ed3deea4c4dc42a283288e1076f5bced140140583e1dedcccbe99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.36/bctx-0.1.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "129722f0b6d9b8a23bbf1c05d536631166c115b0259b1888c8a589f596635c23"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.36/bctx-0.1.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bcdaf088fd545563b850b02a101c1c04596246f9f902c7a6d272c1c12725498a"
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
