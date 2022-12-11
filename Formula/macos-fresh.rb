class MacosFresh < Formula
    include Language::Python::Virtualenv
    desc 'macos-fresh'
    homepage 'https://github.com/d3v1an7/macos-fresh'
    url 'https://github.com/d3v1an7/macos-fresh/releases/download/0.2.0/macos_fresh-0.2.0.tar.gz'
    sha256 '7887043f9c46877574e2b422bf1de65af5998fbf9a928491b0fd7d236fb0c09b'
    version '0.2.0'
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
