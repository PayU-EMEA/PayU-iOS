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
    ss.exclude_files      = 'PUAPI/Sources/PUAPI/*.{docc}'
    ss.resource_bundles   = {'PUAPI' => ['PUAPI/Sources/PUAPI/Certificates/*.{cer}']}
    ss.resources          = ['PUAPI/Sources/PUAPI/Certificates/*.{cer}']
    ss.dependency         'PUSDK/PUCore'
  end

  s.subspec 'PUApplePay' do |ss|
    ss.source_files       = 'PUApplePay/Sources/PUApplePay/**/*'
    ss.exclude_files      = 'PUApplePay/Sources/PUApplePay/*.{docc}'
    ss.framework          = 'PassKit'
  end

  s.subspec 'PUCore' do |ss|
    ss.source_files       = 'PUCore/Sources/PUCore/**/*'
    ss.exclude_files      = 'PUCore/Sources/PUCore/*.{docc}'
    ss.resource_bundles   = {'PUCore' => ['PUCore/Resources/*.{xcassets}']}
    ss.resources          = ['PUCore/Resources/*.{xcassets}']
  end

  s.subspec 'PUMastercardInstallments' do |ss|
    ss.source_files       = 'PUMastercardInstallments/Sources/PUMastercardInstallments/**/*'
    ss.exclude_files      = ['PUMastercardInstallments/Sources/PUMastercardInstallments/*.{docc}']
    ss.dependency         'PUSDK/PUCore'
    ss.dependency         'PUSDK/PUTheme'
    ss.dependency         'PUSDK/PUTranslations'
  end

  s.subspec 'PUPaymentCardScanner' do |ss|
    ss.source_files       = 'PUPaymentCardScanner/Sources/PUPaymentCardScanner/**/*'
    ss.exclude_files      = ['PUPaymentCardScanner/Sources/PUPaymentCardScanner/Documentation.docc']
    ss.framework          = 'AVFoundation'
    ss.framework          = 'CoreImage'
    ss.framework          = 'CoreGraphics'
    ss.framework          = 'Vision'
    ss.dependency         'PUSDK/PUCore'
    ss.dependency         'PUSDK/PUTheme'
    ss.dependency         'PUSDK/PUTranslations'
  end

  s.subspec 'PUTheme' do |ss|
    ss.source_files       = 'PUTheme/Sources/PUTheme/**/*'
    ss.exclude_files      = 'PUTheme/Sources/PUTheme/*.{docc}'
    ss.dependency         'Kingfisher', '6.3.1'
    ss.dependency         'PUSDK/PUCore'
  end

  s.subspec 'PUThreeDS' do |ss|
    ss.source_files       = 'PUThreeDS/Sources/PUThreeDS/**/*'
    ss.exclude_files      = 'PUTheme/Sources/PUThreeDS/*.{docc}'
    ss.framework          = 'WebKit'
    ss.dependency         'PUSDK/PUAPI'
    ss.dependency         'PUSDK/PUCore'
  end

  s.subspec 'PUTranslations' do |ss|
    ss.source_files       = 'PUTranslations/Sources/PUTranslations/**/*'
    ss.exclude_files      = ['PUTranslations/Sources/PUTranslations/*.{docc}']
    ss.resource_bundles   = {'PUTranslations' => ['PUTranslations/Sources/PUTranslations/Resources/*.{lproj}']}
    ss.resources          = ['PUTranslations/Sources/PUTranslations/Resources/*.{lproj}']
    ss.dependency         'PUSDK/PUCore'
  end

  s.subspec 'PUWebPayments' do |ss|
    ss.source_files       = 'PUWebPayments/Sources/PUWebPayments/**/*'
    ss.exclude_files      = ['PUWebPayments/Sources/PUWebPayments/*.{docc}']
    ss.framework          = 'WebKit'
    ss.dependency         'PUSDK/PUCore'
    ss.dependency         'PUSDK/PUTheme'
    ss.dependency         'PUSDK/PUTranslations'
  end

end