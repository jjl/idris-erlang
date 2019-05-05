.PHONY: runtime build install

build: runtime
	stack build

runtime:
	cd irts && erlc *.erl

install: build
	cd libs/erlang && stack exec idris -- --install erlang.ipkg



