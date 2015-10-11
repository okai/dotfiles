
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

        # 各種ブラウザを起動
        alias chrome='open -a /Applications/Google\ Chrome.app "$@"'

        # nvmの設定
        # http://liginc.co.jp/web/programming/node-js/85318
        if [[ -s ~/.nvm/nvm.sh ]];
        then source ~/.nvm/nvm.sh
        fi
esac
