# vfox plugin for [fossil](https://fossil-scm.org)

This plugin is intended for use with [mise](https://mise.jdx.dev).

It supports **listing** the versions of fossil and **installation** of the binaries
for supported operating systems.

It does so by parsing the fossil download page.

> **BEWARE**: Fossil typically only offers downloads for the two most recent versions. So, by all accounts, using anything but "latest" is likely pointless. This makes "version management" for fossil installations a little useless, but being able to include fossil in `mise.toml` files is still a nice-to-have for easily spinning up a full development environment.

## Usage in mise

Either install locally:

```
mise plugin add fossil vfox:https://github.com/aksdb/vfox-fossil
```

or reference it in one (or more) of your `mise.toml`:

```toml
[plugins]
fossil="vfox:https://github.com/aksdb/vfox-fossil"

[tools]
fossil="latest"
```
