# Note to self: AVOID SUFFIX ALIASES, their not that cool
# Unfortunateley there are people who haven't realized that putting suffixes
# on executables is a horrible idea. 
# Therefore doing something like this
#
# alias -s sh=vim
#
# will make ./install.sh open vim, which is gross.
#

# Global
alias ls="ls -AG"

KERNAL=`uname`

if [[ $KERNAL == "Darwin" ]]; then 
    # OS X Aliases
    alias archey="archey --offline"

    # Because wiping your SSH key when you meant to copy it is too painful
    alias pbcopy="pbcopy <"

    # Because I like sane default behavior
    alias cp="cp -rp"

    # View file permissions
    alias permissions="stat -f '%A %a %N'"

    # xtoolchain for bleeding edge iOS and OS X development
    export swift_latest="/Library/Developer/Toolchains/swift-latest.xctoolchain"
    alias rmDerivedData="rm -rf ~/Library/Developer/Xcode/DerivedData"
    alias xclaunch="xcrun launch-with-toolchain /Library/Developer/Toolchains/swift-latest.xctoolchain"

    export PATH=$swift_latest

    # Ruby version manager
    if [ -x /usr/local/bin/rbenv ];
    then
        export PATH=$HOME/.rbenv/bin:$PATH
        eval "$(rbenv init -)"
    fi

elif [[ $KERNAL == "FreeBSD" ]]; then
    export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:$HOME/bin
    export MM_CHARSET=UTF-8
    export LANG=en_US.UTF-8
fi

# Add private aliases to private_aliases.zsh in your $ZSH directory
if [ -f $ZSH/private_aliases.zsh ];
then
    source $ZSH/private_aliases.zsh
fi


