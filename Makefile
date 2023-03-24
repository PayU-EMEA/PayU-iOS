.PHONY: help generate_documentation generate_mocks xcodebuild_test

help: Makefile
	@sed -n "s/^##//p" $<

## ➡️  generate_documentation: Generate `docs` folder with generated `PUSDK.doccarchive`
generate_documentation:
	./docc-generate-documentation.sh
	sleep 5
	./docc-update-documentation.sh

## ➡️  generate_mocks: Generate *.mocks
generate_mocks:
	./generate-mocks.sh

## ➡️  xcodebuild_test: Run all tests
xcodebuild_test:
	./xcodebuild-test.sh
