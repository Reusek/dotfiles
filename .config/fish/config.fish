fish_add_path ~/.local/bin/
fish_add_path ~/.cargo/bin/

if status is-interactive
    # Commands to run in interactive sessions can go here
    and not set -q TMUX
    exec tmux
end
