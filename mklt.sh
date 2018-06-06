pdflatex -shell-escape main.tex && bibtex main.aux && pdflatex -shell-escape main.tex && zathura main.pdf &
