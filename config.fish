alias cloze="ssh aravind@cloze.cs.umd.edu"
alias weather="curl v2.wttr.in"

#alias ubuntu="akoneru@192.168.1.101"
#alias openlab="akoneru@openlab.umiacs.umd.edu"

function ubuntu
    ssh akoneru@192.168.1.101
end

function remote
    ssh -p 543 akoneru@aravind.ddns.net
end

function openlab
    ssh akoneru@openlab.umiacs.umd.edu
end

alias dc="docker-compose"

set PATH $PATH "/Users/aravindkoneru/Library/Python/3.8/bin"
