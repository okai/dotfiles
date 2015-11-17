# Vimライクな操作にする
bindkey -v

# 補完機能
autoload -U compinit
compinit

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups
setopt share_history

# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# ディレクトリ名を入力するだけで移動
setopt auto_cd

# 移動したディレクトリを記録しておく。"cd -[Tab]"で移動履歴を一覧
setopt auto_pushd

# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
# 参照：http://qiita.com/uasi/items/c4288dd835a65eb9d709
setopt pushd_ignore_dups

# コマンド訂正
setopt correct

# 補完候補を詰めて表示する
setopt list_packed

# 補完候補表示時などにピッピとビープ音をならないように設定
setopt nolistbeep

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

# PYTHONPATHの設定
export PYTHONPATH='/usr/local/lib/python3.5/site-packages'

## Default shell configuration
#
# set prompt
#
case ${UID} in
        0)
                PROMPT="%B%{[31m%}%/#%{[m%}%b "
                PROMPT2="%B%{[31m%}%_#%{[m%}%b "
                RPROMPT="%B%{[31m%}%/#%{[m%}%b"
                SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
                [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
                ;;
        *)
                PROMPT="%{[31m%}%m:%n%% "
                PROMPT2="%{[31m%}%_%%%{[m%} "
                RPROMPT="%{[32m%}%~%{[m%}"
                SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
                [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{[37m%}${HOST%%.*} ${RPOMPT}"
                ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
        kterm*|xterm)
                precmd() {
                        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
                }
                ;;
esac
