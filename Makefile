mise:
	. /tmp/mise.sh

install: mise
	pnpm install

build:
	pnpm run build

schema: install
	pnpm run build:schema

dev: install schema
	pnpm run dev

clean:
	rm -rf node_modules ./.husky/_/ && find . -type f \( -name '*.lua' -o -name '*.json' \) -path './lua/schemas/**' -exec rm {} \;

clean-all:
	git clean -dfX


sort:
	find . -type f -name '*.json' -not -path '*node_modules*' -not -path '*snippets*' | fzf | xargs cat | jq -r --sort-keys

all: clean-all install build clean
