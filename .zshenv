# PATH setting
# array variable 'path' is synced PATH
path=(
    $path
    /usr/local/root/bin(N-/)
    /usr/local/python/bin(N-/)
)

# 'less' command settings
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS='-M -R -N'
export PAGER=less
export LESSCHARSET=utf-8
export VISUAL=vim

export LESS_TERMCAP_mb=$'\E[33m'     # Begins blinking
export LESS_TERMCAP_md=$'\E[33m'     # Begins bold
export LESS_TERMCAP_me=$'\E[0m'         # Ends mode
export LESS_TERMCAP_se=$'\E[0m'         # Ends standout-mode
export LESS_TERMCAP_so=$'\E[00;44;30m'  # Begins standout-mode
export LESS_TERMCAP_ue=$'\E[0m'         # Ends underline
export LESS_TERMCAP_us=$'\E[36m'     # Begins underline

case ${OSTYPE} in
    darwin*) # Macでの設定

        # GNU系コマンドのディレクトリにパスを通す
        # export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

        # /usr/local/sbin/, /usr/local/bin/ にパスを通す
        # export PATH=/usr/local/sbin:/usr/local/bin:$PATH

        # /usr/local/opt/ にパスを通す
        # export PATH=/usr/local/opt:$PATH

        # Vimの設定
        # export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
        # alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
        # alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
        # alias vim='/usr/local/bin/vim "$@"'

        # VESTAの設定
        alias vesta='open -a /Applications/VESTA/VESTA.app'

        # screencaptureコマンドを短縮する
        alias sc='screencapture -s "$@"'
        alias scw='screencapture -w "$@"'

        # 各種ブラウザを起動
        # alias chrome='open -a /Applications/Google\ Chrome.app "$@"'

        # nvmの設定
        # http://liginc.co.jp/web/programming/node-js/85318
        # if [[ -s ~/.nvm/nvm.sh ]];
        # then source ~/.nvm/nvm.sh
        # fi
esac
