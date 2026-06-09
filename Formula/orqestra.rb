class Orqestra < Formula
  desc "AI-powered SDLC orchestration CLI"
  homepage "https://orqestra.work"
  version "0.9.32"

  on_macos do
    on_arm do
      url "https://github.com/orqestraai/orqestra-releases/releases/download/v0.9.32/orqestra-macos-arm64.tar.gz"
      sha256 "c801260bfcbb4bb4299393242f23b53d8014e7e6626630077afd939959b0ab23"
    end
  end

  def install
    # Homebrew unpack flattens the single top-level `orqestra/` dir from the tarball.
    (libexec/"orqestra").install "_internal", "orqestra"
    bin.install_symlink libexec/"orqestra"/"orqestra" => "orqestra"
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
