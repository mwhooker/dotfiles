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
