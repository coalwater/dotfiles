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

    set_color yellow
    # echo -n '⊛' (kubectl config view --minify --output 'jsonpath={..namespace}')
    echo -n ' AWS_PROFILE:'(echo $AWS_PROFILE)
    echo -n ' AWS_REGION:'(echo $AWS_REGION)
    echo -n ' '

    # kubernetes context
    set_color blue
    echo -n ' ⊛ '
    set_color normal
    # store current context in a variable
    set -l current_context (kubectl config current-context)
    # if context has the word production in it, set color to red
    # if it has the word staging in it, set color to yellow
    # otherwise set color to blue
    if string match -q -r 'production' $current_context
        set_color red
    else if string match -q -r 'staging' $current_context
        set_color yellow
    else
      set_color blue
    end
    echo -n (kubectl config current-context)
    echo -n ' '

    # clear color
    set_color normal


    #aws sts get-caller-identity > /dev/null &> /dev/null
    #if test $status -ne 0
    #  set_color red
    #else
    #  set_color yellow
    #end
    #echo -n 'aws '
    #set_color normal

    # git
    # git icon
    echo -n '| '
    set_color green
    echo -n ' '
    set_color normal
    fish_git_prompt '%s'
    echo

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    echo -n '➤ '
    set_color normal
end
