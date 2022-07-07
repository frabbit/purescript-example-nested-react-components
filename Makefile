#.PHONY: watch
#watch:
#	npx spago run --watch

.PHONY: build
build:
	npx spago build

.PHONY: start
start:
	npx parcel html/index.html