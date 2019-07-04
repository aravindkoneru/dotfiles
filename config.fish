alias cloze="ssh aravind@cloze.cs.umd.edu"

function ubuntu
    ssh akoneru@192.168.1.101
end

function remote
    ssh -p 543 akoneru@aravind.ddns.net
end

# opam configuration
source /Users/aravindkoneru/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
