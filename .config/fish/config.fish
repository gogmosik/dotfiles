if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias rm="rmt"
alias ls="lsd"
alias cat="bat"
alias hyprconf="vim ~/.config/hypr/hyprland.conf"

set -g fish_color_user green
set fish_greeting ""
fastfetch
echo

set -gx EDITOR vim
set -gx VISUAL kate

set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

set -x LC_TIME ru_RU.UTF-8

# pnpm
set -gx PNPM_HOME "/home/gogmosik/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Created by `pipx` on 2026-02-05 16:20:34
set PATH $PATH $HOME/.local/bin
