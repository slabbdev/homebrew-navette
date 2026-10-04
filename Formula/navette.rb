class Navette < Formula
  desc "The browser for agents — one tiny binary driving the OS WebView (MCP native)"
  homepage "https://github.com/slabbdev/navette"
  version "1.4.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/slabbdev/navette/releases/download/v1.4.1/navette-darwin-arm64"
    sha256 "359cf3526fce4bcc8e9cc0fca9563d142a6e48c1b5f06f3385fe0c38a1a21416"
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
