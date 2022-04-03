# Vimライクな操作にする
bindkey -v

# Add Emacs-like keybinds to Vi mode
# refer: https://qiita.com/b4b4r07/items/8db0257d2e6f6b19ecb9
bindkey -M viins '\er' history-incremental-pattern-search-forward
bindkey -M viins '^?'  backward-delete-char
bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^B'  backward-char
bindkey -M viins '^D'  delete-char-or-list
bindkey -M viins '^E'  end-of-line
bindkey -M viins '^F'  forward-char
bindkey -M viins '^G'  send-break
bindkey -M viins '^H'  backward-delete-char
bindkey -M viins '^K'  kill-line
bindkey -M viins '^N'  down-line-or-history
bindkey -M viins '^P'  up-line-or-history
bindkey -M viins '^R'  history-incremental-pattern-search-backward
bindkey -M viins '^U'  backward-kill-line
bindkey -M viins '^W'  backward-kill-word
bindkey -M viins '^Y'  yank

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

# Add the ROOT's path to $PATH
export PATH=/Application/root_v6.27.01/bin:$PATH

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
                [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{[37m%}${HOST%%.*}:%n%% ${PROMPT}"
                ;;
        *)
                PROMPT="%{[31m%}%m:%n%% "
                PROMPT2="%{[31m%}%_%%%{[m%} "
                RPROMPT="%{[32m%}%~%{[m%}"
                SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
                [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{[37m%}${HOST%%.*}:%n%% ${RPOMPT}"
                # [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{[31m%}%m:%n%% "
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
