class MacosFresh < Formula
  desc "Super opinionated tools, apps and defaults for macOS"
  homepage "https://github.com/d3v1an7/macos-fresh"
  url "https://github.com/d3v1an7/macos-fresh/releases/download/1.0.5/macos-fresh-1.0.5.tar.gz"
  sha256 "694f116df704db6d15ca8b3ad265d04575d3d0e0abb72f1a7fe37c2cfcb3085c"
  license "GLWTPL"
  depends_on "node"

  def install
    libexec.install "dist/fresh.mjs"
    prefix.install "package.json"
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
