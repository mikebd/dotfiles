function svndiff
{
    if [[ "$1" == "--whitespace" ]]; then
        shift
    else
        local -r ignoreWhitespace="-x -b"
    fi

    if which colordiff > /dev/null 2>&1; then
        svn diff $ignoreWhitespace --diff-cmd colordiff "$@" | less
    else
        svn diff $ignoreWhitespace "$@" | less
    fi
}

