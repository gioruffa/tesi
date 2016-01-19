NAME = tesi
TEX  = $(NAME).tex
DVI  = $(TEX:.tex=.dvi)
PS   = $(DVI:.dvi=.ps)
PDF  = $(PS:.ps=.pdf)
BIB  = biblio
BIBTEX = $(BIB).tex
BIBBIB = $(BIB).bib
BBL = $(NAME:.tex=.bbl)
CONVERSION = convertbiblio.py

all: $(PDF)
#all: $(BIB) $(PDF)

$(PDF): $(PS)
	ps2pdf $(PS) $(PDF)

$(PS): $(DVI)
	dvips $(DVI)

$(DVI): $(TEX)
	latex $(TEX)

$(BIB): $(DVI) biblio.tex RMP.bib
	$(CONVERSION) $(BIBTEX) > $(BIBBIB)
	bibtex $(NAME)

clean:
	rm *~ *.toc *.blg *.log *.aux $(NAME).out $(DVI) $(PS) $(BIB)

