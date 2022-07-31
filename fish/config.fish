if status is-interactive
    set --export APP_HOME ~/app_home;
    set --export NGINX_HOME $APP_HOME/nginx;
    set --export ANDROID $HOME/Library/Android;
    set --export ANDROID_HOME $ANDROID/sdk;
    set -gx PATH $ANDROID_HOME/tools $PATH;
    set -gx PATH $ANDROID_HOME/tools/bin $PATH;
    set -gx PATH $ANDROID_HOME/platform-tools $PATH;
    set -gx PATH $ANDROID_HOME/emulator $PATH
    set -gx PATH $NGINX_HOME/bin $PATH
    set -gx PATH $HOME/.cargo/bin $PATH

    alias notifyme "echo 'Job Done!' | terminal-notifier -sound default"
    
end
