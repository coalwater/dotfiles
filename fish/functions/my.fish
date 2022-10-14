
abbr ghost 'nvim +GhostStart'


function fish_greeting
  neofetch
end

function set_window_title
  echo -ne "\e]0;$argv\007"
end

bind \cc 'commandline ""'


function read_text
  set -l text (echo $argv | tr ' ' '+')
  curl -s "https://text-to-speech-demo.ng.bluemix.net/api/v3/synthesize?text=$text&voice=en-US_EmilyV3Voice&download=true&accept=audio%2Fmp3" -o /tmp/tts; and cvlc --play-and-exit --no-repeat /tmp/tts > /dev/null; and rm /tmp/tts
end


function fish_greeting
  neofetch
end

#Abbreviations

abbr checkout 'git checkout'
abbr commit 'git commit'
abbr add 'git add'
abbr rebase 'git rebase -i origin/main'
abbr fetch 'git fetch -p'
abbr ff 'git merge --ff-only'
abbr pf 'git push origin HEAD --force-with-lease'
abbr fixup 'git commit --fixup'
abbr squash 'git rebase -i --autosquash origin/main'
abbr amn 'git commit --amend --no-edit'

alias oneline "xsel -b -o | tr -d '\n' | tr -s ' ' | xsel -b -i"

#aliases
alias mux tmuxinator

# fundle plugin 'tuvistavie/fish-ssh-agent'
