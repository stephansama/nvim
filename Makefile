install:
	pnpm install

build:
	pnpm run build

dev:
	make install && pnpm run build:schema && pnpm run dev

clean:
	rm -rf node_modules && rm -rf ./.husky/_/ && find . -type f \( -name './lua/schemas/*.lua' -o -name './lua/schemas/*.json' \) -exec rm {} \;

clean-all:
	git clean -dfX

schema:
	make install && pnpm run build:schema

all:
	make clean-all && make install && make build && make clean
