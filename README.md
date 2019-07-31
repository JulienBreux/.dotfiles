# 🎛 Personal dotfiles

## Getting started

### Install brew

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Execute brew bundle install

```bash
brew bundle
```

### Run post-install

```bash
task setup
```

### Theme for iTerm

- See [Kevin Smets Gist](https://gist.github.com/kevin-smets/8568070)

### Alias

- `lls`: List all human readable
- `k`: `kubctl`
- `h`: `helm`
- `d`: `docker`
- `c`: `code`
- `tf`: `terraform`
- `tg`: `terragrunt`
- `t`: `task`
- `bb`: `brew bundle`
- `a`: `aws`
- `cdf`: Go to `.dotfiles` dir

### Useful commands

- `zs`: Source  `.zshrc` files
- `zt`: Execute `.dotfiles` tasks

### Dotfiles command

- `github:docker:login`: Github - Docker login
- `setup`: Setup installation
- `setup:omz`: Setup Oh My ZSH
- `setup:omz:plugins`: Setup Oh My ZSH Plugins
- `setup:omz:theme`: Setup Oh My ZSH Themes
- `setup:os`: Setup OS
- `setup:shell`: Setup shell

## GPG Signature

You can download Julien Breux's public key to verify the signature.

`gpg --keyserver hkp://pgp.mit.edu --recv-keys 0BD023FA`
