# https://developer.apple.com/documentation/xcode/distributing-documentation-to-external-developers

XCODE_SCHEME="PUSDK"
XCODE_DERIVED_DATA_PATH="docc"
XCODE_DESTINATION="platform=iOS Simulator,OS=16.2,name=iPhone 14"
XCODE_OTPUT_PATH="docs"

# Removes `DerivedData` if exists
rm -rf ~/Library/Developer/Xcode/DerivedData

# Generates documentation
xcodebuild docbuild \
  -scheme "$XCODE_SCHEME" \
  -derivedDataPath "$XCODE_DERIVED_DATA_PATH" \
  -destination "$XCODE_DESTINATION"
