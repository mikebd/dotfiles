# Include this via .bash_profile with:
#    [ -r ~/.include/profile.sh ] && . ~/.include/profile.sh

for i in ~/.include/profile.d/*.sh ; do
    if [ -r "$i" ]; then
        if [ "${-#*i}" != "$-" ]; then
            . $i
        else
            . $i >/dev/null 2>&1
        fi
    fi
done
unset i
