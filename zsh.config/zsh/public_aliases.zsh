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
alias lsa="ls -AG"

KERNAL=`uname`

if [[ $KERNAL == "Darwin" ]]; then 
    # OS X Aliases
    alias archey="archey --offline"

    # Because wiping your SSH key when you meant to copy it is too painful
    alias autocopy="pbcopy <"

    # View file permissions
    alias permissions="stat -f '%A %a %N'"

    elif [[ $KERNAL == "FreeBSD" ]]; then      
    
    #archey alias for *BSD
    alias archey="bsdinfo"
    
    # autocopy works like pbcopy in OS X/macOS
    _autoreleasepoolcopy() {
        cat $1 | xclip -selection clipboard 
     }

    alias autocopy=_autoreleasepoolcopy

    # A sane path
    export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin
    
    # open command opens current window in thunar (xfce's "finder")
    # Linux already has an open command, so we'll just use thunar on that platform, unfortunatley 
    if [[ $DESKTOP_SESSION == "xfce" ]]; then
        alias open="thunar"
    fi


    # UTF-8 all the things!
    export MM_CHARSET=UTF-8
    export LANG=en_US.UTF-8
fi

# Ruby version manager
if hash rbenv 2>/dev/null; then
    export PATH=$HOME/.rbenv/bin:$PATH
	eval "$(rbenv init -)"

    if [[ $KERNAL == "FreeBSD" ]]; then 
  # temporary work around for https://github.com/rbenv/rbenv/issues/881
        export RUBY_CONFIGURE_OPTS=--with-opt-dir=/usr/local
        export CC=clang
    fi
fi

# set vim as editor for everything ever
export VISUAL=vim
export EDITOR="$VISUAL"

# Add private aliases to private_aliases.zsh in your $ZSH directory
if [ -f $ZSH/private_aliases.zsh ];
then
    source $ZSH/private_aliases.zsh
fi

