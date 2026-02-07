eval "$(oh-my-posh init bash --config $HOME/.config/ohmyposh/zen.toml)"

# kitty ssh fix
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"


# run package manager binaries
export PATH="$PATH:$HOME/.cargo/bin"
