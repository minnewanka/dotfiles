function sc --description 'Connect to a sesh session using fzf'
    set -l session (sesh list | fzf)
    if test -n "$session"
        sesh connect $session
    end
end
