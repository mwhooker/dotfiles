# miscellaneous helper functions
function myip() {
    curl -s 'https://api.ipify.org?format=text'
}

# thx @justincampbell
function gocode() {
  cd $GOPATH/src/${1:-$(
  find $GOPATH/src -type d -maxdepth 3 | \
    grep "src/.*/.*/.*$" | \
    cut -f 7-9 -d "/" | \
    pick
  )}
}

alias lsd="ls -ld -- */"

alias goversion="gdb -q -ex \"p 'runtime.buildVersion'\" -ex quit"
alias iscgo="gdb -q -ex \"p 'runtime.iscgo'\" -ex quit"
alias tf=terraform
alias wakedogfish="wakeonlan f0:79:59:6d:78:ee"
alias docker-gc="docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock spotify/docker-gc"
# docker system prune -a

export VIMRC=$HOME/dev/vimrc
