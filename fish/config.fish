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
abbr rebase 'git rebase origin/main -i'
abbr fetch 'git fetch -p'
abbr ff 'git merge --ff-only'
abbr pf 'git push origin HEAD --force-with-lease'
abbr fixup 'tig && git commit --no-gpg-sign --fixup (pbpaste)'
abbr squash 'git rebase origin/main -i --autosquash'
abbr amn 'git commit --amend --no-edit'
abbr amnn 'git commit --amend --no-edit --no-gpg-sign'
abbr amnp "git commit --am --no-edit && git push origin HEAD --force-with-lease"
abbr gsign "git rebase --exec \"git commit --amend --no-edit -S\" origin/main"
abbr --set-cursor pro export AWS_PROFILE=%
abbr logs "kubectl logs -f -l (klabel)"
abbr pods "kubectl get pods"
abbr --set-cursor rspec "bin/rspec --order defined --fail-fast --format documentation %"
abbr gd --function gdiff

function gdiff
    set branch (git branch | sed 's/^ *//' | fzf)
    git diff --name-only origin/main...$branch | xargs git diff origin/main..$branch --
end

function klabel
  echo app=(kubectl get -o yaml (kubectl get pods -o name | fzf) | yq '.metadata.labels.app')
end

function dclog
  docker-compose logs -f (docker-compose config --services 2>/dev/null | fzf)
end

function profile
  set profile (cat ~/.aws/config | ggrep profile | sed -r "s/\[profile (.*)\]/\1/g" | fzf)
  export AWS_PROFILE=$profile
end

function fish_greeting
  neofetch
end

function kexec
  kubectl exec -it (kubectl get -o yaml (kubectl get pods -o name | fzf) | yq '.metadata.name') -- bin/rails c
end

function fixcli
  set -e AWS_PROFILE
  set -e AWS_REGION
  aws sso logout && bu aws update && bu kubernetes setup
end

function kcontext
  kubectl config use-context (kubectl config get-contexts -o name | fzf)
end

function safe_bash
  echo -n 'if command -v bash > /dev/null 2>&1; then bash; else sh; fi'
end

function show
  git show $argv | tig
end

function colors
  for i in (seq 0 255)
    set -l color (printf "\e[38;5;%sm%03d\e[0m" $i $i)
    echo -n $color " "
    if test (math "$i % 16") -eq 0
      echo
    end
  end
end

if test (tty) = "/dev/tty1"
  startx
end

abbr ghost 'nvim +GhostStart'

if status is-interactive
  rbenv init - fish | source
  kubectl completion fish | source
  fundle plugin 'tuvistavie/fish-ssh-agent'
  fundle plugin 'jichu4n/fish-command-timer'
  fundle plugin 'evanlucas/fish-kubectl-completions'
  fundle plugin 'oh-my-fish/plugin-aws'
  fundle plugin 'oh-my-fish/plugin-ssh'
  fundle plugin 'franciscolourenco/done'
  fundle plugin 'gazorby/fish-abbreviation-tips'
  fundle init
end

# gpg ssh agent
export SSH_AUTH_SOCK=(gpgconf --list-dirs agent-ssh-socket)

# timer
set fish_command_timer_enabled 1
set fish_command_timer_status_enabled 1
set fish_command_timer_color blue
set fish_command_timer_success_color green
set fish_command_timer_fail_color red

