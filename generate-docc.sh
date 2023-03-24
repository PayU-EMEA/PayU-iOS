# https://developer.apple.com/documentation/xcode/distributing-documentation-to-external-developers

# Generates documentation for all packages
rm -rf ~/Library/Developer/Xcode/DerivedData
xcodebuild docbuild \
  -scheme PUSDK \
  -derivedDataPath docc \
  -destination 'platform=iOS Simulator,name=iPhone 14 Pro'
