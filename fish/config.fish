if status is-interactive
    set --export ANDROID $HOME/Library/Android;
    set --export ANDROID_HOME $ANDROID/sdk;
    set -gx PATH $ANDROID_HOME/tools $PATH;
    set -gx PATH $ANDROID_HOME/tools/bin $PATH;
    set -gx PATH $ANDROID_HOME/platform-tools $PATH;
    set -gx PATH $ANDROID_HOME/emulator $PATH
    alias notifyme "echo 'Job Done!' | terminal-notifier -sound default"
end
