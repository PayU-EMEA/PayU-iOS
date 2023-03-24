.PHONY: help generate_documentation generate_mocks

help: Makefile
	@sed -n "s/^##//p" $<

## ➡️  generate_documentation: Generate `docs` folder with generated `PUSDK.doccarchive`
generate_documentation:
	./generate-documentation.sh

## ➡️  generate_mocks: Generate *.mocks
generate_mocks:
	./generate-mocks.sh

## ➡️  xcodebuild_test: Run all tests
xcodebuild_test:
	./xcodebuild-test.sh
