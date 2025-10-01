MISE = if [ -f /tmp/mise.sh ]; then . /tmp/mise.sh; fi;

install:
	$(MISE) pnpm install

build:
	$(MISE) pnpm run build

schema: install
	$(MISE) pnpm run build:schema

dev: install schema
	$(MISE) pnpm run dev

clean:
	rm -rf node_modules ./.husky/_/ && find . -type f \( -name '*.lua' -o -name '*.json' \) -path './lua/schemas/**' -exec rm {} \;

clean-all:
	git clean -dfX


sort:
	find . -type f -name '*.json' -not -path '*node_modules*' -not -path '*snippets*' | fzf | xargs cat | jq -r --sort-keys

all: clean-all install build clean
