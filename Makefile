TITLE := Title
CONTROLS := false
PROGRESS := false

slides.html: src/slides.md
	@cleaver \
		--theme . \
		--title "$(TITLE)" \
		--debug \
		--output ./$@ \
		$? \
