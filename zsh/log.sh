# Logging and color helpers (sourced by .zshrc and setup.sh; bash + zsh compatible)
# Only enable color when stdout is a TTY
if [ -t 1 ]; then
  _c_reset=$'\033[0m'
  _c_bold=$'\033[1m'
  _c_dim=$'\033[2;39m'
  _c_red=$'\033[31m'
  _c_green=$'\033[32m'
  _c_yellow=$'\033[33m'
  _c_blue=$'\033[34m'
  _c_magenta=$'\033[35m'
  _c_cyan=$'\033[36m'
else
  _c_reset= _c_bold= _c_dim= _c_green= _c_yellow= _c_red= _c_cyan= _c_magenta= _c_blue=
fi

log_section() { echo "${_c_bold}${_c_cyan}$*${_c_reset}"; }
log_step()    { echo "\n${_c_green}##${_c_reset} $*";     }
log_info()    { echo "${_c_blue}[info]${_c_reset} $*";    }
log_ok()      { echo "${_c_green}[ok]${_c_reset} $*";     }
log_warn()    { echo "${_c_yellow}[warn]${_c_reset} $*";  }
log_err()     { echo "${_c_red}[error]${_c_reset} $*";    }
