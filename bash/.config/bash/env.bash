#
# Environment configuration for interactive shells.
# Curated for development, quality of life, and safety.
#

# --- PATH configuration ---
# Include user's personal bin directories before system paths
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# --- Preferred default applications ---
EDITOR="emacs -nw" # Default text editor in no-window mode
PAGER="less"       # Default pager for long output
BROWSER="firefox"  # Default web browser

# Export them so child processes also know the defaults
export EDITOR PAGER BROWSER

# --- Compilers ---
CC="gcc"   # Default C compiler
CXX="g++"  # Default C++ compiler
export CC CXX

# --- Python settings ---
export PYTHONDONTWRITEBYTECODE=1  # Prevent creation of __pycache__/ .pyc files
