class Orqestra < Formula
  desc "AI-powered SDLC orchestration CLI"
  homepage "https://orqestra.work"
  version "0.9.35"

  on_macos do
    on_arm do
      url "https://github.com/orqestraai/orqestra-releases/releases/download/v0.9.35/orqestra-macos-arm64.tar.gz"
      sha256 "278b1361ec7aa714482578926d78002e946cf4c5e3cf82a10e3e9e5c8fc9bf2d"
    end
  end

  def install
    # Homebrew unpack flattens the single top-level `orqestra/` dir from the tarball.
    (libexec/"orqestra").install "_internal", "orqestra"
    bin.install_symlink libexec/"orqestra"/"orqestra" => "orqestra"
  end

  def fix_dynamic_linkage
    # PyInstaller bundle resolves bundled .so files via @rpath at runtime;
    # Homebrew relocation fails on libs without header padding and isn't needed.
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
