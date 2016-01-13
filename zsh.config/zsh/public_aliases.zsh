# AVOID SUFFIX ALIASES, 
# Unfortunateley there are people who haven't realized that putting suffixes
# on executables is a horrible idea. 
# Therefore doing something like this
#
# alias -s sh=vim
#
# will make ./install.sh open vim, which is abhorrent.
#
# ...auto cd is enough laziness for one shell, 
# let's not get carried away

KERNAL = `../scripts/get_kernal`

if [$KERNAL == "Darwin"]; then 
    # Aliases
    alias ls="ls -AG"
    alias archey="archey --offline"

    # Because wiping your SSH key when you meant to copy it is too painful
    alias pbcopy="pbcopy <"
    alias pbpaste="pbcopy >"

    # Because we like sane default behavior
    alias cp="cp -rp"

    # View file permissions
    alias prm="stat -f '%A %a %N'"



    # xtoolchain
    export swift_latest="/Library/Developer/Toolchains/swift-latest.xctoolchain"
    alias xclaunch="xcrun launch-with-toolchain /Library/Developer/Toolchains/swift-latest.xctoolchain"

    # Why not?
    alias vimrc="$HOME/.vimrc"
    alias zshrc="$HOME/.zshrc"

    # Keep last
    export PATH=$swift_latest:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:$HOME/bin

elif [$KERNAL == "FreeBSD"]; then
    export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:$HOME/bin
fi

