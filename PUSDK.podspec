Pod::Spec.new do |s|  
    s.name    = 'PUSDK'
    s.version = '2.0.0-alpha'
    s.summary = 'PayU mobile SDK for iOS'
    s.homepage  = 'http://developers.payu.com/en/mobile_sdk.html'

    s.author  = { 'PayU' => 'itsupport@payu.pl' }
    s.license = { :type => 'Apache License Version 2.0', :file => 'LICENSE' }

    s.platform  = :ios
    s.source    = { :git => 'https://github.com/PayU-EMEA/PayU-iOS.git', :branch => 'release/2.0.0-alpha' }

    s.ios.deployment_target = '11.0'

    s.subspec 'PUAPI' do |ss|
      ss.source_files = 'PUAPI/Sources/PUAPI/**/*'
      ss.dependency     'PUSDK/PUCore'
    end

    s.subspec 'PUApplePay' do |ss|
      ss.source_files = 'PUApplePay/Sources/PUApplePay/**/*'
    end

    s.subspec 'PUCore' do |ss|
      ss.source_files = 'PUCore/Sources/PUCore/**/*'
    end

    # s.subspec 'PUMastercardInstallments' do |ss|
    #   ss.source_files = 'PUMastercardInstallments/Sources/PUMastercardInstallments/**/*'
    #   ss.dependency 'PUSDK/PUCore'
    #   ss.dependency 'PUSDK/PUTheme'
    #   ss.dependency 'PUSDK/PUTranslations'
    # end

    # s.subspec 'PUPaymentCard' do |ss|
    #   ss.source_files = 'PUPaymentCard/Sources/PUPaymentCard/**/*'
    #   ss.dependency 'PUSDK/PUAPI'
    #   ss.dependency 'PUSDK/PUCore'
    #   ss.dependency 'PUSDK/PUPaymentCardScanner'
    #   ss.dependency 'PUSDK/PUTheme'
    #   ss.dependency 'PUSDK/PUTranslations'
    # end

    # s.subspec 'PUPaymentCardScanner' do |ss|
    #   ss.source_files = 'PUPaymentCardScanner/Sources/PUPaymentCardScanner/**/*'
    #   ss.dependency 'PUSDK/PUTheme'
    #   ss.dependency 'PUSDK/PUTranslations'
    # end

    # s.subspec 'PUPaymentMethods' do |ss|
    #   ss.source_files = 'PUPaymentMethods/Sources/PUPaymentMethods/**/*'
    #   ss.dependency 'PUSDK/PUApplePay'
    #   ss.dependency 'PUSDK/PUCore'
    #   ss.dependency 'PUSDK/PUPaymentCard'
    #   ss.dependency 'PUSDK/PUTheme'
    #   ss.dependency 'PUSDK/PUTranslations'
    # end

    # s.subspec 'PUTheme' do |ss|
    #   ss.source_files = 'PUTheme/Sources/PUTheme/**/*'
    #   ss.dependency 'PUSDK/PUCore'
    #   ss.dependency 'Kingfisher', '6.3.1'
    # end

    # s.subspec 'PUThreeDS' do |ss|
    #   ss.source_files = 'PUThreeDS/Sources/PUThreeDS/**/*'
    #   ss.dependency 'PUSDK/PUAPI'
    #   ss.dependency 'PUSDK/PUCore'
    #   ss.dependency 'PUSDK/PUTheme'
    # end

    # s.subspec 'PUTranslations' do |ss|
    #   ss.source_files = 'PUTranslations/Sources/PUTranslations/**/*'
    #   ss.dependency 'PUSDK/PUCore'
    # end

    # s.subspec 'PUWebPayments' do |ss|
    #   ss.source_files = 'PUWebPayments/Sources/PUWebPayments/**/*'
    #   ss.dependency 'PUSDK/PUTheme'
    #   ss.dependency 'PUSDK/PUTranslations'
    # end

end
