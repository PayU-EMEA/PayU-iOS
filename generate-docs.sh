# https://developer.apple.com/documentation/xcode/distributing-documentation-to-external-developers

# Creates a folder with index.html
cd docc/Build/Products/Debug-iphonesimulator
$(xcrun --find docc) process-archive \
  transform-for-static-hosting PUSDK.doccarchive \
  --output-path ../../../../docs \
  --hosting-base-path docc
cd ../../../../
rm -rf docc
