curl -sSL "https://api.github.com/users/mngad/repos?per_page=500" | grep 'ssh_url' | cut -d '"' -f 4 | parallel git clone "$@"
