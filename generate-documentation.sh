# https://developer.apple.com/documentation/xcode/distributing-documentation-to-external-developers

XCODE_SCHEME="PUSDK"
XCODE_DERIVED_DATA_PATH="docc"
XCODE_DESTINATION="platform=iOS Simulator,OS=16.2,name=iPhone 14"
XCODE_OTPUT_PATH="docs"

# Removes `DerivedData` if exists
rm -rf ~/Library/Developer/Xcode/DerivedData
rm -rf docc

# Generates documentation for all packages
xcodebuild docbuild \
  -scheme "$XCODE_SCHEME" \
  -derivedDataPath "$XCODE_DERIVED_DATA_PATH" \
  -destination "$XCODE_DESTINATION"

# Wait till generated `PUSDK.doccarchive` being processed
sleep 5

# Creates a folder with index.html
cd docc/Build/Products/Debug-iphonesimulator
$(xcrun --find docc) process-archive \
  transform-for-static-hosting PUSDK.doccarchive \
  --output-path ../../../../"$XCODE_OTPUT_PATH" \
  --hosting-base-path docc
cd ../../../../
rm -rf docc
