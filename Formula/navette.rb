class Navette < Formula
  desc "The browser for agents — one tiny binary driving the OS WebView (MCP native)"
  homepage "https://github.com/slabbdev/navette"
  version "1.6.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/slabbdev/navette/releases/download/v1.6.0/navette-darwin-arm64"
    sha256 "9d0b7c3a68eb5594e2f65c3f878a19883f7e604c8e7754293e254ba79c83144d"
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
