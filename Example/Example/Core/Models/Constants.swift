//
//  Constants.swift
//  Example
//
//  Created by PayU S.A. on 21/11/2022.
//  Copyright © 2022 PayU S.A. All rights reserved.
//  

import Foundation

public struct Constants {
  public struct ApplePay {
    public static let merchantIdentifier = "merchantIdentifier"
  }

  public struct Buyer {
    public static let email = "anton.ivashyna@payu.com"
    public static let phone = "+48792667087"
    public static let firstName = "Anton"
    public static let lastName = "Ivashyna"
    public static let language = Constants.Locale.defaultLanguageCode
    public static let extCustomerId = "214142532"
  }

  public struct Order {
    public static let customerIP = "127.0.0.1"
    public static let continueUrl = "https://www.payu.com/"
    public static let description = "PayU Swift"
  }

  public struct Locale {
    public static let defaultCountryCode = "PL"
    public static let defaultCurrencyCode = "PLN"
    public static let defaultLanguageCode = "pl"
  }
}
