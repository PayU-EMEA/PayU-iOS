//
//  ShowDemoApplePayUseCase.swift
//  Example
//
//  Created by PayU S.A. on 29/11/2022.
//  Copyright © 2022 PayU S.A. All rights reserved.
//

// TODO: - ADD APPLE PAY MERCHANT TO EXAMPLE APP

import UIKit
import PUCore
import PUApplePay

final class ShowDemoApplePayUseCase {
  private weak var presenter: UIViewController?

  private let settingsRepository = SettingsRepository()
  private let applePayService = ApplePayServiceFactory().make()

  init(presenter: UIViewController? = nil) {
    self.presenter = presenter
  }

  func execute() {
    let paymentRequest = PaymentRequest(
      countryCode: settingsRepository.getCountryCode(),
      currencyCode: settingsRepository.getCurrencyCode(),
      merchantIdentifier: Constants.ApplePay.merchantIdentifier,
      paymentSummaryItems: [
        PaymentRequest.SummaryItem(label: "Futomaki", amount: 1599),
        PaymentRequest.SummaryItem(label: "Napkin", amount: 49),
        PaymentRequest.SummaryItem(label: "Order", amount: 1599 + 49)
      ],
      shippingContact: PaymentRequest.Contact(
        emailAddress: Constants.Buyer.email)
    )

    applePayService.makePayment(
      paymentRequest: paymentRequest,
      onDidAuthorize: onDidAuthorizeApplePay,
      onDidCancel: onDidCancelApplePay,
      onDidFail: onDidFailApplePay)
  }

  // MARK: - Handlers
  private func onDidAuthorizeApplePay(_ paymentDataToken: String) {
    Console.console.log(value: paymentDataToken, level: .verbose)
    presenter?.dialog(title: "ShowDemoApplePayUseCase", message: paymentDataToken)
  }

  private func onDidCancelApplePay() {
    Console.console.log(value: nil, level: .verbose)
    presenter?.dialog(title: "ShowDemoApplePayUseCase", message: "applePayServiceDidCancel")
  }

  private func onDidFailApplePay(_ error: Error) {
    Console.console.log(value: error, level: .verbose)
    presenter?.dialog(title: "ShowDemoApplePayUseCase", message: error.localizedDescription)
  }
}
