class Orqestra < Formula
  desc "AI-powered SDLC orchestration CLI"
  homepage "https://orqestra.work"
  version "0.9.24"

  on_macos do
    on_arm do
      url "https://github.com/orqestraai/orqestra-releases/releases/download/v0.9.24/orqestra-macos-arm64"
      sha256 "fae70cd103189ce84f0f1cec246db9e34025220beeb0499c61827bbdf0b58298"
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
