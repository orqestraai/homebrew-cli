class Orqestra < Formula
  desc "AI-powered SDLC orchestration CLI"
  homepage "https://orqestra.work"
  version "0.9.30"

  on_macos do
    on_arm do
      url "https://github.com/orqestraai/orqestra-releases/releases/download/v0.9.30/orqestra-macos-arm64"
      sha256 "f403797c13c2a3d17adcabd3fce13e8c7a7a5519b6575bf644f09ab0b23ab971"
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
