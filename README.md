# Gexec: Homebrew

[![General Workflow](https://github.com/gexec/homebrew-gexec/actions/workflows/general.yml/badge.svg)](https://github.com/gexec/homebrew-gexec/actions/workflows/general.yml) [![Codacy Badge](https://app.codacy.com/project/badge/Grade/5adad7656a364377a46b4e480a276fee)](https://app.codacy.com/gh/gexec/homebrew-gexec/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade) [![](https://dcbadge.limes.pink/api/server/Yda8rD4ZkJ)](https://discord.gg/Yda8rD4ZkJ)

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

## Development

```console
bundle install
bundle exec rake rubocop
bundle exec rake spec
```

## Security

If you find a security issue please contact
[gexec@webhippie.de](mailto:gexec@webhippie.de) first.

## Contributing

Fork -> Patch -> Push -> Pull Request

## Authors

-   [Thomas Boerger](https://github.com/tboerger)

## License

Apache-2.0

## Copyright

```console
Copyright (c) 2025 Thomas Boerger <thomas@webhippie.de>
```
