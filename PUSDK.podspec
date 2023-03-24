Pod::Spec.new do |s|  
    s.name              = 'PUSDK'
    s.version           = '2.0.0-alpha'
    s.summary           = 'PayU mobile SDK for iOS'
    s.homepage          = 'http://developers.payu.com/en/mobile_sdk.html'

    s.author            = { 'PayU' => 'itsupport@payu.pl' }
    s.license           = { :type => 'Apache License Version 2.0', :file => 'LICENSE' }

    s.platform          = :ios
    s.source            = { :git => 'https://github.com/PayU-EMEA/PayU-iOS.git', :branch => 'release/2.0.0-alpha' }

    s.ios.deployment_target = '11.0'
    
    s.source_files = 'PUSDK/Sources/PUSDK/**/*'

    s.subspec 'PUAPI' do |ss|
      ss.dependency 'PUSDK/PUCore'
      ss.source_files = 'PUAPI/Sources/PUAPI/**/*'
    end

    s.subspec 'PUCore' do |ss|
      ss.source_files = 'PUCore/Sources/PUCore/**/*'
    end

end