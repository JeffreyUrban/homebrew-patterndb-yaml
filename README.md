# Homebrew Tap for patterndb-yaml

This is the official Homebrew tap for [patterndb-yaml](https://github.com/JeffreyUrban/patterndb-yaml), a YAML-based pattern matching tool with multi-line capabilities for log normalization using syslog-ng patterndb.

## Installation

### Quick Install

```bash
brew tap JeffreyUrban/patterndb-yaml
brew install patterndb-yaml
```

### One-Line Install

```bash
brew install JeffreyUrban/patterndb-yaml/patterndb-yaml
```

## What Gets Installed

When you install `patterndb-yaml` via Homebrew, you get:

- ✅ **patterndb-yaml** - The main CLI tool for log pattern matching
- ✅ **syslog-ng** - Required dependency, installed automatically
- ✅ **Python dependencies** - All Python packages in an isolated virtualenv

## Features

- **Automatic dependency management** - syslog-ng is installed as a dependency
- **Isolated environment** - Python packages don't conflict with your system Python
- **Easy updates** - `brew upgrade patterndb-yaml` to get the latest version
- **Automatic formula updates** - New releases are published automatically

## Usage

After installation, the `patterndb-yaml` command is available in your PATH:

```bash
# Check version
patterndb-yaml --version

# Process logs with a rules file
patterndb-yaml --rules rules.yaml --input app.log

# Process from stdin
cat app.log | patterndb-yaml --rules rules.yaml

# Get help
patterndb-yaml --help
```

## Updating

```bash
# Update Homebrew
brew update

# Upgrade patterndb-yaml
brew upgrade patterndb-yaml
```

## Uninstalling

```bash
# Remove patterndb-yaml (keeps syslog-ng if other formulae depend on it)
brew uninstall patterndb-yaml

# Remove the tap
brew untap JeffreyUrban/patterndb-yaml
```

## Documentation

- **Main Project**: https://github.com/JeffreyUrban/patterndb-yaml
- **Documentation**: https://patterndb-yaml.readthedocs.io/
- **PyPI**: https://pypi.org/project/patterndb-yaml/

## Requirements

- **macOS** 11.0+ (Big Sur) or **Linux**
- **Python** 3.9+ (provided by Homebrew)
- **syslog-ng** 4.10.1+ (installed automatically)

## Troubleshooting

### Command not found after installation

```bash
# Ensure Homebrew's bin is in your PATH
echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### Check installation

```bash
# Verify patterndb-yaml is installed
brew list patterndb-yaml

# Verify syslog-ng is available
syslog-ng --version

# Test basic functionality
echo "test log" | patterndb-yaml --rules <(echo "rules: []")
```

### Reinstall

```bash
brew reinstall patterndb-yaml
```

## Development

This tap uses automated workflows to update the formula when new versions are released:

1. A new release is created in the main repository
2. The release workflow triggers this repository via `repository_dispatch`
3. The update workflow waits for the PyPI release
4. A pull request is automatically created with the updated formula
5. After review, the PR is merged to publish the update

For more details, see [`.github/workflows/update-formula.yml`](.github/workflows/update-formula.yml).

## Contributing

Issues and pull requests should be submitted to the main repository:
https://github.com/JeffreyUrban/patterndb-yaml/issues

Formula-specific issues can be reported here:
https://github.com/JeffreyUrban/homebrew-patterndb-yaml/issues

## License

The formula in this repository is licensed under the MIT License.

The patterndb-yaml software itself is also MIT licensed. See the [main repository](https://github.com/JeffreyUrban/patterndb-yaml) for details.
