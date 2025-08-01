#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# The less clutter prompt I use
PS1='[\w]\n\$ '



function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

export EDITOR=nvim
export VISUAL=nvim
eval "$(zoxide init bash)"

NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

alias \
\
c="clear" \
v="nvim" \
f="fff" \
cat="bat" \
l="ls -lh --color=auto --group-directories-first" \
ls="ls -h --color=auto --group-directories-first" \
la="ls -lah --color=auto --group-directories-first" \
grep="grep --color=auto" \
shell="exec $SHELL -l" \
fk="sudo !!" \
mv="mv -i" \
rm="rm -Iv" \
df="df -h" \
du="du -h -d 1" \
k="killall" \
p="ps aux | grep $1" \

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi
