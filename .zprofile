# alias ls="ls --color -F"
# alias ls="ls -G"
case ${OSTYPE} in
    darwin*)
        alias ls="ls -GF"
        ;;
    linux*)
        alias ls="ls -F --color=auto"
        alias ls="ls -F --color=always"
        ;;
esac

alias cdweb='cd ~/SkyDrive/Dropbox/web/homepage/public_html'
alias cdsotsuken='cd ~/SkyDrive/Dropbox/資料/学習資料/卒業研究'
alias cddialy='cd ~/SkyDrive/Dropbox/日記'
alias cdcompphys='cd ~/SkyDrive/Dropbox/Programming/ComputationalPhysics'
alias colors='python ~/.show-all-256-colors.py'
alias nv='nvim'

# 竹澤研のサーバにssh接続
alias ssh-takezawa-lab='ssh -Y -l students 192.168.10.52'

# 竹澤研のサーバのファイルシステムをマウント
alias sshfs-takezawa-lab='sshfs students@192.168.10.52:/home/students/ ~/takezawa-lab/'
