# Include this via .bashrc with:
#    [ -r ~/.include/bashrc.sh ] && . ~/.include/bashrc.sh

for i in ~/.include/bashrc.d/*.sh ; do
    if [ -r "$i" ]; then
        if [ "${-#*i}" != "$-" ]; then
            . $i
        else
            . $i >/dev/null 2>&1
        fi
    fi
done
unset i
