if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap Goles/battery
brew update
brew upgrade

# Install packages

apps=(
  ansible
  bash-completion2
  bats
  battery
  bfg
  coreutils
  dep
  diff-so-fancy
  dockutil
  ffmpeg
  fasd
  gifsicle
  git
  git-extras
  git-lfs
  gnu-sed --with-default-names
  go
  grep --with-default-names
  hub
  httpie
  imagemagick
  jq
  kubernetes-cli
  lego
  lynx
  mackup
  maven
  nano
  nomad
  pandoc
  peco
  psgrep
  pipenv
  python
  gnu-sed
  shellcheck
  ssh-copy-id
  sonos
  TomAnthony/brews/itermocil
  tree
  unar
  wget
  wifi-password
  yarn
)

brew install "${apps[@]}"

export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"

ln -sfv "$DOTFILES_DIR/etc/mackup/.mackup.cfg" ~
