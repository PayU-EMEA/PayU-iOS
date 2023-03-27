Pod::Spec.new do |s|  
    s.name    = 'PUAPI'
    s.version   = '2.0.0-alpha'
    s.summary   = 'PayU mobile SDK for iOS'
    s.homepage  = 'http://developers.payu.com/en/mobile_sdk.html'

    s.platform              = :ios
    s.ios.deployment_target = '11.0'

    s.author  = { 'PayU' => 'itsupport@payu.pl' }
    s.license = { :type => 'Apache License Version 2.0', :file => 'LICENSE' }

    
    s.source        = { :git => 'https://github.com/PayU-EMEA/PayU-iOS.git', :branch => 'release/2.0.0-alpha' }
    s.source_files  = 'PUAPI/Sources/PUAPI/**/*'

    # s.dependency 'PUCore', :git => 'https://github.com/PayU-EMEA/PayU-iOS.git', :branch => 'release/2.0.0-alpha'
    s.dependency 'PUCore', :path => 'PUCore.podspec'
end
