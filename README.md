# PUSDK

Allows to make payments in PayU ecosystem.

## Requirements

* iOS 11.0 or higher

## Getting Started

* [Backend Integration](https://developers.payu.com/en/restapi.html)
* [Mobile Integration](https://payu-emea.github.io/PayU-iOS/documentation/pusdk/)
* ❗️[Communication](https://developers.payu.com/en/mobile_sdk.html)

## [PUSDK](https://payu-emea.github.io/PayU-iOS/documentation/pusdk) consists of:

* [PUApplePay](https://payu-emea.github.io/PayU-iOS/documentation/pusdk/gettingstartedwithapplepay)
* [PUCore](https://payu-emea.github.io/PayU-iOS/documentation/pusdk/gettingstartedwithcore)
* [PUMastercardInstallments](https://payu-emea.github.io/PayU-iOS/documentation/pusdk/gettingstartedwithmastercardinstallments)
* [PUPaymentCard](https://payu-emea.github.io/PayU-iOS/documentation/pusdk/gettingstartedwithpaymentcard)
* [PUPaymentCardScanner](https://payu-emea.github.io/PayU-iOS/documentation/pusdk/gettingstartedwithpaymentcardscanner)
* [PUPaymentMethods](https://payu-emea.github.io/PayU-iOS/documentation/pusdk/gettingstartedwithpaymentmethods)
* [PUTheme](https://payu-emea.github.io/PayU-iOS/documentation/pusdk/gettingstartedwiththeme)
* [PUThreeDS](https://payu-emea.github.io/PayU-iOS/documentation/pusdk/gettingstartedwiththreeds)
* [PUTranslations](https://payu-emea.github.io/PayU-iOS/documentation/pusdk/gettingstartedwithtranslations)
* [PUWebPayments](https://payu-emea.github.io/PayU-iOS/documentation/pusdk/gettingstartedwithwebpayments)

## Installation

### [Swift Package Manager](https://www.swift.org/package-manager/)

To add a package dependency to your Xcode project, select File > Add Packages. You can also navigate to your target’s General pane, and in the `Frameworks, Libraries, and Embedded Content` section, click the + button, select `Add Other`, and choose `Add Package Dependency`. 

* Package URL: `https://github.com/PayU-EMEA/PayU-iOS.git`
* Dependency Rule: `Branch`
* Branch: `release/2.0.0-alpha`

Then choose Package Products you want to use:

* `PUSDK` - when you want to use the whole Package (Apple Pay, Payment Methods, Web Payments, etc.)
* `{PackageName}` - when you want to use just one special Package

### CocoaPods

When you want to use the whole Package (Apple Pay, Payment Methods, Web Payments, etc.)
* `pod 'PUSDK', :git => 'https://github.com/PayU-EMEA/PayU-iOS.git', :branch => 'release/2.0.0-alpha'`

When you want to use just one special Package
* `pod 'PUSDK/{PackageName}' , :git => 'https://github.com/PayU-EMEA/PayU-iOS.git', :branch => 'release/2.0.0-alpha'`

## Example

// TODO: - Write the STR how to run the example app.
