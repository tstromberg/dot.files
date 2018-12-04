# From http://go/fish-shell
if test -d /google
  source /google/data/ro/teams/fish/google.fish
end

# status -i; and /home/build/google3/experimental/users/tstromberg/minikube/tunnel.sh

set -x CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES "1600x1200,3840x2560"
set --universal fish_user_paths $HOME/bin $HOME/go/bin $fish_user_paths /usr/local/go/bin

