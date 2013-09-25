# Add local directory for libraries, etc
[[ -f "$HOME/local/bin" ]] || mkdir -p "$HOME/local/bin"
PATH="$HOME/local/bin:$PATH"

[[ -f "$HOME/local/lib" ]] || mkdir -p "$HOME/local/lib"
export LD_LIBRARY_PATH="$HOME/local/lib:$LD_LIBRARY_PATH"

export PKG_CONFIG_PATH="$HOME/local/lib/pkgconfig/:$HOME/local/lib/pkg-config/"
