Pod::Spec.new do |s|  
    s.name      = 'PUSDK'
    s.version   = '2.0.0-alpha'
    s.summary   = 'PayU mobile SDK for iOS'
    s.homepage  = 'http://developers.payu.com/en/mobile_sdk.html'

    s.author    = { 'PayU' => 'itsupport@payu.pl' }
    s.license   = { :type => 'Apache License Version 2.0', :file => 'LICENSE' }
    s.source    = { :git => 'https://github.com/PayU-EMEA/PayU-iOS.git', :branch => 'release/2.0.0-alpha' }

    s.platform              = :ios
    s.swift_version         = '5.3'
    s.ios.deployment_target = '11.0'

    s.subspec 'PUAPI' do |ss|
      ss.source_files       = 'PUAPI/Sources/PUAPI/**/*'
      ss.exclude_files      = ['PUAPI/Sources/*.{docc}']
      ss.resource_bundles   = { 'PUAPI' => ['PUAPI/Sources/PUAPI/Certificates/*.{cer}']}
      ss.resources          = ['PUAPI/Sources/PUAPI/Certificates/*.{cer}']
      ss.dependency         'PUSDK/PUCore'
    end

    s.subspec 'PUApplePay' do |ss|
        ss.source_files       = 'PUApplePay/Sources/PUApplePay/**/*'
        ss.exclude_files      = ['PUApplePay/Sources/*.{docc}']
        ss.framework          = 'PassKit'
    end

    s.subspec 'PUCore' do |ss|
      ss.source_files       = 'PUCore/Sources/PUCore/**/*'
      ss.exclude_files      = ['PUCore/Sources/*.{docc}']
      ss.resource_bundles   = { 'PUCore' => ['PUCore/Resources/*.{xcassets}']}
      ss.resources          = ['PUCore/Resources/*.{xcassets}']
    end

    s.subspec 'PUTheme' do |ss|
        ss.source_files       = 'PUTheme/Sources/PUTheme/**/*'
        ss.exclude_files      = ['PUTheme/Sources/*.{docc}']
    end
end
