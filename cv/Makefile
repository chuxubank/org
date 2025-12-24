EMACS ?= emacs
ELISP := scripts/export.el

.PHONY: all awesomecv awesomecv-cn altacv moderncv

all: awesomecv awesomecv-cn altacv moderncv

awesomecv:
	$(EMACS) --batch -l $(ELISP) --eval "(cv-export \"awesomecv\" \"awesomecv.tex\")"

awesomecv-cn:
	$(EMACS) --batch -l $(ELISP) --eval "(cv-export \"awesomecv\" \"awesomecv-cn.tex\" \"zh-CN\")"

altacv:
	$(EMACS) --batch -l $(ELISP) --eval "(cv-export \"altacv\" \"altacv.tex\" \"zh-CN\")"

moderncv:
	$(EMACS) --batch -l $(ELISP) --eval "(cv-export \"moderncv\" \"moderncv.tex\" \"zh-CN\")"
