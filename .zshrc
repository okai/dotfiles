
case ${OSTYPE} in
    darwin*) # Macでの設定

        # GNU系コマンドのディレクトリにパスを通す
        export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

        # /usr/local/sbin/, /usr/local/bin/ にパスを通す
        export PATH=/usr/local/sbin:/usr/local/bin:$PATH

        # /usr/local/opt/ にパスを通す
        export PATH=/usr/local/opt:$PATH

        # php-buildのパスを追加
        export PHP_VERSIONS=${HOME}/local/php/versions
        [ -f $(brew --perfix php-version)/php-version.sh ] && source $(brew --prefix php-version)/php-version.sh && php-version 5.4.0 >/dev/null

        # Vimの設定
        # export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
        # alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
        # alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
        alias vim='/usr/local/bin/vim "$@"'

        # VESTAの設定
        alias vesta='open -a /Applications/VESTA/VESTA.app'

        # screencaptureコマンドを短縮する
        alias sc='screencapture -s "$@"'
        alias scw='screencapture -w "$@"'

        # nvmの設定
        # http://liginc.co.jp/web/programming/node-js/85318
        if [[ -s ~/.nvm/nvm.sh ]];
        then source ~/.nvm/nvm.sh
        fi
esac


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
