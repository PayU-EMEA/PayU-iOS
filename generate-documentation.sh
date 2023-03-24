# https://developer.apple.com/documentation/xcode/distributing-documentation-to-external-developers

# Removes `DerivedData` if exists
rm -rf ~/Library/Developer/Xcode/DerivedData

# Generates documentation for all packages
xcodebuild docbuild \
  -scheme PUSDK \
  -derivedDataPath docc \
  -destination 'platform=iOS Simulator,name=iPhone 14 Pro'

# Wait till generated `PUSDK.doccarchive` being processed
sleep 5

# Creates a folder with index.html
cd docc/Build/Products/Debug-iphonesimulator
$(xcrun --find docc) process-archive \
  transform-for-static-hosting PUSDK.doccarchive \
  --output-path ../../../../docs \
  --hosting-base-path docc
cd ../../../../
rm -rf docc
