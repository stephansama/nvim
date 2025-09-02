install:
	pnpm install

build:
	pnpm run build

dev:
	pnpm run build:schema && pnpm run dev

clean:
	rm -rf node_modules && find . -type f -name '*schema.lua' -exec rm {} \;

clean-all:
	git clean -dfX

all:
	make clean-all && make install && make build && make clean
