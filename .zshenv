# --------------------- #
# ENVIRONMENT VARIABLES #
# --------------------- #

export EDITOR=nvim
export PAGER=less

# ----------- #
# GLOBAL PATH #
# ----------- #

path+=("$HOME/.local/bin")
# path+=("/usr/share/musikcube")
path+=("/home/senotoki/.cargo/bin")

export PATH

# ----------- #

# pnpm
export PNPM_HOME="/home/senotoki/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

