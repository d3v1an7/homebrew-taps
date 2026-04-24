class MacosFresh < Formula
    include Language::Python::Virtualenv
    desc 'macos-fresh'
    homepage 'https://github.com/d3v1an7/macos-fresh'
    url 'https://github.com/d3v1an7/macos-fresh/releases/download/1.0.2/macos-fresh-1.0.2.tar.gz'
    sha256 '506860e42b65fead0e5c2799390dd5fdfaf6d2d96f3f2265a6b9b3f854bbf223'
    version '1.0.2'
    depends_on 'python@3.11'
    def install
      venv = virtualenv_create(libexec, 'python3')
      system libexec/'bin/pip', 'install', '-v', '--ignore-installed', buildpath
      bin.install_symlink libexec/'bin/fresh' => 'fresh'
    end
    test do
      false
    end
  end
