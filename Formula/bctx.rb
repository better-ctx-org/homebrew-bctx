class Bctx < Formula
  desc "Context-aware execution runtime for LLM coding agents"
  homepage "https://betterctx.com"
  version "0.1.41"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.41/bctx-0.1.41-aarch64-apple-darwin.tar.gz"
      sha256 "fe03febd039bbd2146fabafc16401e24b0ffbc6614c2b1ec85d1ddee57b013e4"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.41/bctx-0.1.41-x86_64-apple-darwin.tar.gz"
      sha256 "95d498a61bea5c6aed84edeb44dad8bbbc91690d0f78977227879c7e0b958a88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.41/bctx-0.1.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1b03b62caf870ab780b2f97223009877b34419f604a9dc22be2a59c45caf59b9"
    end
    on_intel do
      url "https://github.com/better-ctx-org/bctx-releases/releases/download/v0.1.41/bctx-0.1.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a600749748e5bac49f7a01e2796a4e957e54c84509a63b62667371817d03f754"
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
