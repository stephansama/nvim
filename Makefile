install:
	pnpm install

build:
	pnpm run build

dev:
	pnpm run build:schema && pnpm run dev

clean:
	rm -rf node_modules lua/lang/zod.lua

clean-all:
	git clean -dfX

all:
	make clean-all && make install && make build && make clean
