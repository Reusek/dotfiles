fish_add_path ~/.local/bin/

alias vim="nvim"

if status is-interactive
and not set -q TMUX
    exec tmux
end
