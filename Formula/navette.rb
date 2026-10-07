class Navette < Formula
  desc "The browser for agents — one tiny binary driving the OS WebView (MCP native)"
  homepage "https://github.com/slabbdev/navette"
  version "1.7.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/slabbdev/navette/releases/download/v1.7.0/navette-darwin-arm64"
    sha256 "45857afc7a51b42e6d27c42295600aa7120c461829fd1d384bb22060d2d401ca"
  end

  def install
    bin.install "navette-darwin-arm64" => "navette"
  end

  def caveats
    <<~EOS
      This tap ships the macOS arm64 build. Windows and Linux: grab the
      release binary from https://github.com/slabbdev/navette/releases
      or run: cargo install navette-browser
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/navette --version")
  end
end
