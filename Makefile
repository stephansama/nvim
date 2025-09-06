install:
	pnpm install

build:
	pnpm run build

dev:
	make install && pnpm run build:schema && pnpm run dev

clean:
	rm -rf node_modules ./.husky/_/ && find . -type f -name '*.lua' -path './lua/schemas/**' -exec rm {} \; && find . -type f -name '*.json' -path './lua/schemas/**' -exec rm {} \;

clean-all:
	git clean -dfX

schema:
	make install && pnpm run build:schema

all:
	make clean-all && make install && make build && make clean
