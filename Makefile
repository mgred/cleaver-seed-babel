TITLE := Title

slides.html: src/slides.md
	@./node_modules/.bin/cleaver \
		--theme . \
		--title "$(TITLE)" \
		--debug \
		--output ./$@ \
		$? \
