class Orqestra < Formula
  desc "AI-powered SDLC orchestration CLI"
  homepage "https://orqestra.work"
  version "0.9.25"

  on_macos do
    on_arm do
      url "https://github.com/orqestraai/orqestra-releases/releases/download/v0.9.25/orqestra-macos-arm64"
      sha256 "4f9e50f496a3d568141779960d45ff0110b424f250a577981a793869610dec15"
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
