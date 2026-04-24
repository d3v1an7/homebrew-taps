class MacosFresh < Formula
  desc "Super opinionated tools, apps and defaults for macOS"
  homepage "https://github.com/d3v1an7/macos-fresh"
  url "https://github.com/d3v1an7/macos-fresh/releases/download/1.0.3/macos-fresh-1.0.3.tar.gz"
  sha256 "45ffcffbc556e3a21ffa1001d3fbb809691c521b9f222f41a852d463a445bcab"
  license "GLWTPL"
  depends_on "node"

  def install
    libexec.install "dist/fresh.mjs"
    (bin/"fresh").write <<~EOS
      #!/bin/sh
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/fresh.mjs" "$@"
    EOS
    chmod 0755, bin/"fresh"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/fresh --help")
  end
end
