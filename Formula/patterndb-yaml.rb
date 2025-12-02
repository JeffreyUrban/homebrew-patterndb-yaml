class PatterndbYaml < Formula
  include Language::Python::Virtualenv

  desc "YAML-based pattern matching for log normalization using syslog-ng patterndb"
  homepage "https://github.com/JeffreyUrban/patterndb-yaml"
  url "https://files.pythonhosted.org/packages/c8/24/d1ead64d75da17dd03415a85cc4c2e24c6af63d1c743e87a7b4fb7ca00ae/patterndb_yaml-0.1.0.tar.gz"
  sha256 "1a39b9f86521b1ba992253648198f47fe57bde170a3ef7372a60c6894422d211"
  license "MIT"

  # Runtime dependencies
  depends_on "libyaml"
  depends_on "python@3.12"
  depends_on "syslog-ng"

  # Python package dependencies
  resource "typer" do
    url "https://files.pythonhosted.org/packages/b8/e5/ab0e01be35ca2d5389c6c402eb54e10633aba159608d7270292b6f882a45/typer-0.15.1.tar.gz"
    sha256 "a0588c0a7fa68a1978a069818657778f86abe6ff5ea6abf472f940a08bfe4f0a"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/ab/3a/0316b28d0761c6734d6bc14e770d85506c986c85ffb239e688eeaab2c2bc/rich-13.9.4.tar.gz"
    sha256 "439594978a49a09530cff7ebc4b5c7103ef57baf48d5ea3184f21d9a2befa098"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/source/P/PyYAML/pyyaml-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/source/p/packaging/packaging-24.2.tar.gz"
    sha256 "c228a6dc5e932d346bc5739379109d49e8853dd8223571c7c5b55260edc0b97f"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/source/c/click/click-8.1.8.tar.gz"
    sha256 "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07ed0/markdown-it-py-3.0.0.tar.gz"
    sha256 "e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/source/m/mdurl/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/source/P/Pygments/pygments-2.18.0.tar.gz"
    sha256 "786ff802f32e91311bff3889f6e9a86e81505fe99f2735bb6d60ae0c5004f199"
  end

  resource "shellingham" do
    url "https://files.pythonhosted.org/packages/source/s/shellingham/shellingham-1.5.4.tar.gz"
    sha256 "8dbca0739d487e5bd35ab3ca4b36e11c4078f3a234bfce294b0a0291363404de"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.12.2.tar.gz"
    sha256 "1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # Test that the binary is installed
    assert_match "patterndb-yaml version", shell_output("#{bin}/patterndb-yaml --version")

    # Test syslog-ng dependency
    assert_match "syslog-ng", shell_output("syslog-ng --version")

    # Test basic functionality with a simple rules file
    (testpath/"rules.yaml").write <<~EOS
      rules:
        - name: test_rule
          pattern:
            - text: "test"
    EOS

    # Process a test log line
    output = pipe_output("#{bin}/patterndb-yaml --rules #{testpath}/rules.yaml --quiet", "test\n")
    assert_match "test", output
  end
end
