.PHONY: paper

paper:
	mkdir -p pdf
	~/.cabal/bin/pandoc \
		--toc \
		--smart \
		--filter ~/.cabal/bin/pandoc-crossref \
		--csl tex/acm.csl \
		--number-sections \
		-H tex/header.tex \
		-B tex/title.tex \
		-N \
		-V lang=de-DE \
		--highlight-style tango \
		--variable urlcolor=cyan \
		-o pdf/paper.tex \
		*.md
	cd pdf && latexmk -pdf paper.tex
	cp pdf/paper.pdf paper.pdf

clean:
	rm pdf -r

install:
	sudo apt update
	sudo apt install make latexmk texlive-latex-recommended texlive-fonts-recommended texlive-latex-extra texlive-fonts-extra texlive-luatex texlive-lang-german
	sudo apt install cabal-install
	cabal update
	cabal install pandoc happy pandoc-crossref
