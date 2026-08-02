# Gexec: Homebrew

[![General Workflow](https://github.com/gexec/homebrew-gexec/actions/workflows/general.yml/badge.svg)](https://github.com/gexec/homebrew-gexec/actions/workflows/general.yml) [![Codacy Badge](https://app.codacy.com/project/badge/Grade/5adad7656a364377a46b4e480a276fee)](https://app.codacy.com/gh/gexec/homebrew-gexec/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade) [![Discord](https://img.shields.io/discord/1335976189025849395)](https://discord.gg/Yda8rD4ZkJ)

Homebrew repository to install [Gexec](https://gexec.eu) on macOS.

## Prepare

```console
brew tap gexec/gexec
```

## Install

### gexec-server

```console
brew install gexec-server
gexec-server -h
```

### gexec-runner

```console
brew install gexec-runner
gexec-runner -h
```

### gexec-client

```console
brew install gexec-client
gexec-client -h
```

## Security

If you find a security issue please contact
[gexec@webhippie.de](mailto:gexec@webhippie.de) first.

## Development

We use [mise][mise] to manage all required tools and their versions. Install it
by following the [official installation instructions][mise-install], then run
the following commands inside the repository to activate mise and install all
tools defined in `mise.toml`:

```console
mise trust
mise install
```

After that you should be able to use the regular commands for the development of
Ruby files or Brews in general:

```console
bundle install
bundle exec rake rubocop
bundle exec rake spec
```

## Contributing

Generally we are following [conventional commits][commits] when we apply
changes. That way we are able to generate proper changelogs for every release.
Please use always pull requests to integrate new functionalities or to fix
issues.

For the release process we are following [semantic versioning][semver] which
clearly indicates if a new version just resolves bugs, includes new features or
even includes breaking changes.

After installing the tools via `mise install` as described above set up the
pre-commit hooks so they run automatically on every commit:

```console
pre-commit install --hook-type pre-commit --hook-type commit-msg
```

> `pre-commit` is managed by mise and will be available after `mise install`.

If you have changed something on the source you should simply commit following
the mentioned conventions:

```console
git checkout -b feat/new-feature
git add --all
git commit -m 'feat: added awesome new feature'
git push --set-upstream origin feat/new-feature
```

After pushing your changes into the Git repository you should create a pull
request on GitHub. If the pull request have been merged and everything built
fine it will also create automatically a new release at least once a week.

## Authors

-   [Thomas Boerger](https://github.com/tboerger)

## License

Apache-2.0

## Copyright

```console
Copyright (c) 2025 Thomas Boerger <thomas@webhippie.de>
```

[mise]: https://mise.jdx.dev/
[mise-install]: https://mise.jdx.dev/getting-started.html
[commits]: https://www.conventionalcommits.org/en/v1.0.0/
[semver]: https://semver.org/
