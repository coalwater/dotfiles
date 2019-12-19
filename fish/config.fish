# chruby
set -gx CHRUBY_ROOT '/usr'
set -gx CHRUBY_AUTO_ENABLED true

# editor
set -gx EDITOR '/usr/bin/nvim'

# set -U fish_user_paths ~/.bin

#aliases
alias mux tmuxinator

# chruby
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

fundle plugin 'tuvistavie/fish-ssh-agent'
# fundle plugin 'oh-my-fish/plugin-chruby'
fundle init

function fish_greeting
  neofetch
end

alias oneline "xsel -b -o | tr -d '\n' | tr -s ' ' | xsel -b -i"

#Abbreviations

abbr checkout 'git checkout'
abbr commit 'git commit'
abbr add 'git add'
abbr rebase 'git rebase origin/master -i'
abbr fetch 'git fetch -p'
abbr ff 'git merge --ff-only'
abbr pf 'git push origin HEAD --force-with-lease'
abbr fixup 'git commit --fixup'
abbr squash 'git rebase origin/master -i --autosquash'
abbr amn 'git commit --amend --no-edit'

function fish_greeting
  neofetch
end

function show
  git show $argv | tig
end

abbr ghost 'nvim +GhostStart'

if test (tty) = "/dev/tty1"
  startx
end

function fish_greeting
  neofetch
end
