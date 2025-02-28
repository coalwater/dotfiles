
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

alias oneline "xsel -b -o | tr -d '\n' | tr -s ' ' | xsel -b -i"

#aliases
alias mux tmuxinator

function kcontext
  kubectl config use-context (kubectl config get-contexts -o name | fzf)
end
