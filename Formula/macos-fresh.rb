class MacosFresh < Formula
    include Language::Python::Virtualenv
    desc 'macos-fresh'
    homepage 'https://github.com/d3v1an7/macos-fresh'
    url 'https://github.com/d3v1an7/macos-fresh/releases/download/0.3.0/macos_fresh-0.3.0.tar.gz'
    sha256 '155b6b90f1571856a2c74fada6efd2fd7c60049b11b560bedb02c4f309f6ab16'
    version '0.3.0'
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
