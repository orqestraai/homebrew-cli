class Orqestra < Formula
  desc "AI-powered SDLC orchestration CLI"
  homepage "https://orqestra.work"
  version "0.9.14"

  on_macos do
    on_arm do
      url "https://github.com/orqestraai/orqestra-releases/releases/download/v0.9.14/orqestra-macos-arm64"
      sha256 "72b6aeec69aadfd3b00d1e2b9eea5c126bdaeb78b2bbf2170cefa3444ae9e9cb"
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
