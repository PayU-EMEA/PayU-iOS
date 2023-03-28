XCODE_SCHEME="PUSDK-Package"
XCODE_DESTINATION="platform=iOS Simulator,OS=16.2,name=iPhone 14"

echo "✅ xcodebuild test $XCODE_SCHEME ..."
xcodebuild \
  -scheme "$XCODE_SCHEME" \
  -destination "$XCODE_DESTINATION" \
  -testLanguage en \
  -testRegion en_US \
  test
