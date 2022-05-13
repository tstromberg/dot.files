set -gx PATH $HOME/bin $HOME/go/bin $fish_user_paths /usr/local/go/bin /usr/pkg/bin /usr/pkg/sbin /opt/homebrew/bin /opt/homebrew/sbin /sbin $PATH

if status --is-login
  wotd
end

set -gx KOCACHE "$HOME/.kocache"

set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

if [ -f "$HOME/google-cloud-sdk/path.fish.inc" ]; . "$HOME/google-cloud-sdk/path.fish.inc"; end
if [ -f "$HOME/bin/google-cloud-sdk/path.fish.inc" ]; . "$HOME/bin/google-cloud-sdk/path.fish.inc"; end
