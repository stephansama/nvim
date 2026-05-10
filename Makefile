MISE = if [ -f /tmp/mise.sh ]; then . /tmp/mise.sh; fi;

generate-dictionary:
	curl -L -o ./dictionary/words.txt https://github.com/dwyl/english-words/raw/refs/heads/master/words.txt

install:
	$(MISE) pnpm install

build:
	$(MISE) pnpm run build

dev: install
	$(MISE) pnpm run dev

clean-all:
	git clean -dfX

sort:
	find . -type f -name '*.json' -not -path '*node_modules*' -not -path '*snippets*' | fzf | xargs cat | jq -r --sort-keys

all: clean-all install build
