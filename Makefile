clean:
	rm -rf ./docs/_build

build:
	make clean
	jupyter-book build ./docs/

deploy:
	make build
	ghp-import -n -p -f docs/_build/html
