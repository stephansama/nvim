install:
	pnpm install

build:
	pnpm run build

dev:
	make install && pnpm run build:schema && pnpm run dev

clean:
	rm -rf node_modules ./.husky/_/ && find . -type f \( -name '*.lua' -o -name '*.json' \) -path './lua/schemas/**' -exec rm {} \;

clean-all:
	git clean -dfX

schema:
	make install && pnpm run build:schema

sort:
	find . -type f -name '*.json' -not -path '*node_modules*' -not -path '*snippets*' | fzf | xargs cat | jq -r --sort-keys

all:
	make clean-all && make install && make build && make clean
