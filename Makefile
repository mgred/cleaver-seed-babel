TITLE := Title

SRC = $(wildcard src/scripts/*.js)
TMP = $(SRC:src/scripts/%.js=tmp/%.js)

tmp: $(TMP)
tmp/%.js: ./src/scripts/%.js
	mkdir -p $(@D)
	./node_modules/.bin/babel \
		$< \
		--presets="env" \
		--out-file $@ \
		--no-babelrc \

theme: theme/script.js theme/style.css

theme/script.js: tmp
	mkdir -p $(@D)
	./node_modules/.bin/browserify $?/main.js -o $@

theme/style.css: src/style.css
	mkdir -p $(@D)
	cp $? $@

slides.html: theme src/slides.md
	@./node_modules/.bin/cleaver \
		--theme ../theme \
		--title "$(TITLE)" \
		--debug \
		--output ./$@ \
		$(lastword $?) \

clean:
	rm -rf tmp theme

clean-all: clean
	rm -f slides.html

node_modules: package.json
	npm install

install: node_modules
