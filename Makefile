.PHONY: runtime build install test_primitives test_special_ctors

build: runtime
	stack build

runtime:
	cd irts && erlc *.erl

install: build
	cd libs/erlang && stack exec idris -- --install erlang.ipkg

test_primitives: install
	cd examples/test_primitives && \
	stack exec idris -- --codegen=erlang --package=erlang MainErl.idr -o main.erl
	cd examples/test_primitives && erlc -Wall main.erl

test_special_ctors: install
	cd examples/test_special_ctors && \
	stack exec idris -- --codegen=erlang --package=erlang MainErl.idr -o main.erl
	cd examples/test_special_ctors && erlc -Wall main.erl


