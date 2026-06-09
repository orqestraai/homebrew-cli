class Orqestra < Formula
  desc "AI-powered SDLC orchestration CLI"
  homepage "https://orqestra.work"
  version "0.9.33"

  on_macos do
    on_arm do
      url "https://github.com/orqestraai/orqestra-releases/releases/download/v0.9.33/orqestra-macos-arm64.tar.gz"
      sha256 "f25723eda9b768d626357d963bcca0039f65d90782afe96b8c77ed0b4ccfea7d"
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
