# https://developer.apple.com/documentation/xcode/distributing-documentation-to-external-developers

XCODE_SCHEME="PUSDK"
XCODE_DERIVED_DATA_PATH="docc"
XCODE_DESTINATION="generic/platform=ios"
XCODE_OTPUT_PATH="docs"

# Creates static page for documentation
cd "$XCODE_DERIVED_DATA_PATH"/Build/Products/Debug-iphoneos
$(xcrun --find docc) process-archive \
  transform-for-static-hosting "$XCODE_SCHEME".doccarchive \
  --output-path ../../../../"$XCODE_OTPUT_PATH" \
  --hosting-base-path PayU-iOS
cd ../../../../
rm -rf docc
