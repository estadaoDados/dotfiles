#SSH
alias diraol_ssh='ssh diraol@diraol.eng.br'
alias polignu_ssh='ssh polignu@polignu.org'
alias radar_ssh='ssh radarparlamentar@radarparlamentar.polignu.org'
alias amazon_gnuteca='ssh -i ~/devel/awsKeys/awskey_gnuteca.pem ubuntu@ec2-177-71-154-142.sa-east-1.compute.amazonaws.com'

#EnvUpdate
function vimspfupdate {
    curDir=$(pwd)
    SPF13vimHome="$HOME/.spf13-vim-3"
    cd $SPF13vimHome
    git pull
    git submodule sync
    git submodule update --init --recursive
    cd $curDir
}
