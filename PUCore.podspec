Pod::Spec.new do |s|  
  s.name    = 'PUCore'
  s.version   = '2.0.0-alpha'
  s.summary   = 'PayU mobile SDK for iOS'
  s.homepage  = 'http://developers.payu.com/en/mobile_sdk.html'

  s.platform              = :ios
  s.ios.deployment_target = '11.0'

  s.resource_bundles = { 'PUCore' => ['PUCore/Resources/*.{xcassets}']}
  s.resources = ['PUCore/Resources/*.{xcassets}']

  s.author  = { 'PayU' => 'itsupport@payu.pl' }
  s.license = { :type => 'Apache License Version 2.0', :file => 'LICENSE' }
  
  s.source        = { :git => 'https://github.com/PayU-EMEA/PayU-iOS.git', :branch => 'release/2.0.0-alpha' }
  s.source_files  = 'PUCore/Sources/PUCore/**/*'
  s.exclude_files = 'PUCore/Sources/Documentation'
end
