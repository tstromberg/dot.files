# From http://go/fish-shell
set -x CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES "1600x1200,3840x2560"
set -gx PATH $HOME/bin $HOME/go/bin $fish_user_paths /usr/local/go/bin /usr/pkg/bin /usr/pkg/sbin /opt/homebrew/bin /opt/homebrew/sbin /sbin $PATH

if status --is-login
  wotd
end

set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/t/google-cloud-sdk/path.fish.inc' ]; . '/Users/t/google-cloud-sdk/path.fish.inc'; end
