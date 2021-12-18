if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings

    abbr -a -g lzg lazygit
    abbr -a -g lzd lazydocker
    abbr -a -g gst git status
    abbr -a -g gc git commit
    abbr -a -g ga git add

    set -gx EDITOR nvim

    zoxide init fish | source
end
