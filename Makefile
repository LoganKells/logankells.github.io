.PHONY: clean
clean:
	rm -rf ./_build

.PHONY: run
run:
	poetry run jupyter-book start

.PHONY: build
build:
	make clean
	poetry run jupyter-book build --html

.PHONY: run-build
run-build:
	make build
	python -m http.server 8000 --directory _build/html

.PHONY: deploy
deploy:
	make build
	ghp-import -n -p -f _build/html
