# From http://go/fish-shell
set -x CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES "1600x1200,3840x2560"
set --universal fish_user_paths $HOME/bin $HOME/go/bin $fish_user_paths /usr/local/go/bin /usr/local/flutter/bin
source $HOME/google-cloud-sdk/path.fish.inc

set -g fish_user_paths "/usr/local/bin" "/usr/local/opt/openjdk/bin" $fish_user_paths
set -gx PATH /usr/pkg/bin /usr/pkg/sbin /sbin $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/t/google-cloud-sdk/path.fish.inc' ]; . '/Users/t/google-cloud-sdk/path.fish.inc'; end
