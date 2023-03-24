# https://developer.apple.com/documentation/xcode/distributing-documentation-to-external-developers

XCODE_SCHEME="PUSDK"
XCODE_DERIVED_DATA_PATH="docc"
XCODE_DESTINATION="generic/platform=ios"
XCODE_OTPUT_PATH="docs"

# Removes `DerivedData` if exists
rm -rf ~/Library/Developer/Xcode/DerivedData

# Build
xcodebuild build \
  -scheme "$XCODE_SCHEME" \
  -destination "$XCODE_DESTINATION"

# Generates
xcodebuild docbuild \
  -scheme "$XCODE_SCHEME" \
  -derivedDataPath "$XCODE_DERIVED_DATA_PATH" \
  -destination "$XCODE_DESTINATION"
