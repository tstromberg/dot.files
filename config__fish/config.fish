set -gx PATH $HOME/bin $HOME/go/bin $HOME/.local/bin /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin $fish_user_paths /usr/local/go/bin /usr/pkg/bin /usr/pkg/sbin /opt/homebrew/bin /opt/homebrew/sbin /sbin $PATH

fish_default_key_bindings

set -gx KOCACHE "$HOME/.kocache"
set -gx EDITOR "nvim"
set -gx CLOUDSDK_PYTHON "/usr/bin/python3"
set -gx COSIGN_EXPERIMENTAL "1"
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

if [ -f "$HOME/google-cloud-sdk/path.fish.inc" ]; . "$HOME/google-cloud-sdk/path.fish.inc"; end
if [ -f "$HOME/bin/google-cloud-sdk/path.fish.inc" ]; . "$HOME/bin/google-cloud-sdk/path.fish.inc"; end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/var/home/t/google-cloud-sdk/path.fish.inc' ]; . '/var/home/t/google-cloud-sdk/path.fish.inc'; end

source ~/.safe-chain/scripts/init-fish.fish # Safe-chain Fish initialization script