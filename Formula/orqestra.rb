class Orqestra < Formula
  desc "AI-powered SDLC orchestration CLI"
  homepage "https://orqestra.work"
  version "0.9.15"

  on_macos do
    on_arm do
      url "https://github.com/orqestraai/orqestra-releases/releases/download/v0.9.15/orqestra-macos-arm64"
      sha256 "23b934c539cf82c2ee8713e9ff6c9eb41416813370fa3b0a4f4939707fc1b40d"
    end
  end

  def install
    bin.install "orqestra-macos-arm64" => "orqestra"
  end

  def caveats
    <<~EOS
      Run `orqestra auth login` to connect to the Control Center.
    EOS
  end

  test do
    output = shell_output("#{bin}/orqestra --version 2>&1")
    assert_match version.to_s, output
  end
end
