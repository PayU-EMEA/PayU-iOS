# https://developer.apple.com/documentation/xcode/distributing-documentation-to-external-developers

XCODE_SCHEME="PUSDK"
XCODE_DERIVED_DATA_PATH="docc"
XCODE_DESTINATION="platform=iOS Simulator,OS=16.2,name=iPhone 14"
XCODE_OTPUT_PATH="docs"

# Creates static page for documentation
cd docc/Build/Products/Debug-iphonesimulator
$(xcrun --find docc) process-archive \
  transform-for-static-hosting PUSDK.doccarchive \
  --output-path ../../../../"$XCODE_OTPUT_PATH" \
  --hosting-base-path docc
cd ../../../../
rm -rf docc
