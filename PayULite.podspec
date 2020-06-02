Pod::Spec.new do |s|  
    s.name              = 'PayULite'
    s.version           = '0.9.0'
    s.summary           = 'PayU mobile SDK for iOS'
    s.homepage          = 'http://developers.payu.com/en/mobile_sdk.html'

    s.author            = { 'Piotr Gorzelany' => 'piotr.gorzelany@payu.com' }
    s.license           = { :type => 'Apache License Version 2.0', :file => 'LICENSE' }

    s.platform          = :ios
    s.source            = { :git => 'https://github.com/PayU-EMEA/PayU-iOS.git', :tag => s.version.to_s }

    s.ios.deployment_target = '10.0'
    s.ios.vendored_frameworks = 'libs/PayU_SDK_Lite.framework'
end