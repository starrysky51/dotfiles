# .bash_profile

if [[ -f ~/.bashrc ]]; then
	. ~/.bashrc
fi

export PATH="/usr/local/sbin:$PATH"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# iterm2
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# pip
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# mysql
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# bash-completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
