.SUFFIXES: .m4 .ru .en
.m4.en:
	m4 --define=lang=en $*.m4 >$*.en
.m4.ru:
	m4 --define=lang=ru $*.m4 >$*.ru

M4SOURCES := $(shell find . $(pwd) -name '*.m4')
RU_LISTINGS := $(M4SOURCES:%.m4=%.ru)
EN_LISTINGS := $(M4SOURCES:%.m4=%.en)

all:    russian english russian-A5 english-A5 \
	russian-lite english-lite russian-A5-lite english-A5-lite

clean:
	rm -f *.aux
	rm -f *.fls
	rm -f *.swp
	rm -f *.pdf
	rm -f *.out
	rm -f *.toc
	rm -f *.stackdump
	rm -f *.bbl
	rm -f *.blg
	rm -f *.fdb_latexmk
	rm -f *.idx
	rm -f *.ilg
	rm -f *.ind
	rm -f *.html
	rm -f *.tmp
	rm -f *-2k
	rm -f *.4ct
	rm -f *.4tc
	rm -f *.dvi
	rm -f *.glg
	rm -f *.glo
	rm -f *.gls
	rm -f *.idv
	rm -f *.ist
	rm -f *.xref
	rm -f *.torrent
	rm -f *.en
	rm -f *.ru
	rm -f RE_for_beginners-*.log
	rm -f Reverse_Engineering_for_Beginners-*.log
	rm -f *~
	rm -f *.log
	rm -f *.lyx
	rm -f *.ni
	rm -f *.odt
	rm -f *.rtf

define compile
	rm -f *.fls
	rm -f *.bbl
	rm -f *.aux
	xelatex $1
	biber $1
	makeindex $1
	makeglossaries $1
	xelatex $1
endef

russian: $(RU_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-ru)

english: $(EN_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-en)

russian-A5: $(RU_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-ru-A5)

english-A5: $(EN_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-en-A5)

russian-lite: $(RU_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-ru-lite)

english-lite: $(EN_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-en-lite)

russian-A5-lite: $(RU_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-ru-A5-lite)

english-A5-lite: $(EN_LISTINGS)
	$(call compile,Reverse_Engineering_for_Beginners-en-A5-lite)
