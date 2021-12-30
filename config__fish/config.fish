# From http://go/fish-shell
set -x CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES "1600x1200,3840x2560"
set -gx PATH $HOME/bin $HOME/go/bin $fish_user_paths /usr/local/go/bin /usr/pkg/bin /usr/pkg/sbin /sbin $PATH

if status --is-login
  wotd
end

