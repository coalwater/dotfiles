function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    # Timestamp
    set_color yellow
    echo -n (date "+[%H:%M:%S] ")

    # User
    set_color $fish_color_user
    echo -n (whoami)

    # @
    set_color yellow
    echo -n '@'

    # Host
    set_color $fish_color_host
    echo -n (prompt_hostname)

    set_color yellow
    echo -n ':'

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    echo

    set_color red
    echo -n '' (ruby -v | cut -d' ' -f 2)

    # set_color normal
    # echo -n '|'

    # set_color blue
    # echo -n '⊛' (kubectl config view --minify --output 'jsonpath={..namespace}')
    set_color normal

    __terlar_git_prompt
    echo

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    echo -n '➤ '
    set_color normal
end
