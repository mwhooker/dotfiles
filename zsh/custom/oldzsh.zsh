setopt EXTENDED_GLOB
snippets=$(dirname $0)/oldzsh
for zshrc_snipplet in $snippets/S[0-9][0-9]*[^~] ; do
    source $zshrc_snipplet
done
unset snippets
unset zshrc_snipplet
