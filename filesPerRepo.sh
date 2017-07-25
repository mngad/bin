#!/bin/sh
# - Makes index for repositories in a single directory.
# - Makes static pages for each repository directory.
#
# NOTE, things to do manually (once):
# - copy style.css, logo.png and favicon.png manually, a style.css example
#   is included.
# - write clone url, for example "git://git.codemadness.org/dir" to the "url"
#   file for each repo.
#
# Usage:
# - mkdir -p htmldir && cd htmldir
# - sh example.sh

# path must be absolute.
reposdir="/home/fraun/git_repos"
curdir="/srv/http/git"

# make index.
stagit-index "${reposdir}/"*/ > "${curdir}/index.html"

# make files per repo.
for dir in "${reposdir}/"*/; do
	# strip .git suffix.
	r=$(basename "${dir}")
	d=$(basename "${dir}" ".git")
	printf "%s... " "${d}"

	mkdir -p "${curdir}/${d}"
	cd "${curdir}/${d}"
	stagit -c ".cache" "${reposdir}/${r}"

	# symlinks
	ln -sf log.html index.html
	ln -sf ../style.css style.css
	ln -sf ../logo.png logo.png
	ln -sf ../favicon.png favicon.png

	printf "done\n"
done
