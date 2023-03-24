//
//  DemoPaymentWidgetViewModel.swift
//  Example
//
//  Created by PayU S.A. on 23/11/2022.
//  Copyright © 2022 PayU S.A. All rights reserved.
//  

import PUApplePay
import PUCore
import PUPaymentMethods
import UIKit

protocol DemoPaymentMethodsWidgetViewModelPresenter: AnyObject {
  var presenterViewController: UIViewController? { get }
}

final class DemoPaymentMethodsWidgetViewModel {

  // MARK: - Public Properties
  weak var presenter: DemoPaymentMethodsWidgetViewModelPresenter?

  // MARK: - Private Properties
  private let processor = PaymentMethodsProcessor.Factory().make()
  private let dataRepository = DataRepository()
  private let settingsRepository = SettingsRepository()

  // MARK: - Initialization
  init() {
    processor.applePayPaymentRequestProvider = self
    processor.blikAuthorizationCodePresenter = self
  }

  // MARK: - Public Methods
  func didSelect(_ paymentMethod: PaymentMethod) {
    processor.process(
      paymentMethod: paymentMethod,
      onDidProcess: onDidProcess,
      onDidFail: onDidFail)
  }

  func didDelete(_ paymentMethod: PaymentMethod) {
    dataRepository.deletePaymentMethod(token: paymentMethod.value) { result in
      Console.console.log(value: paymentMethod, level: .verbose)
    }
  }

  // MARK: - Private Methods
  private func onDidProcess(_ payMethod: PayMethod) {
    presenter?.presenterViewController?.dialog(title: "PayMethod", message: payMethod.formattedDescription)
    Console.console.log(value: payMethod, level: .verbose)
  }

  private func onDidFail(_ error: Error) {
    presenter?.presenterViewController?.dialog(title: "PayMethod", message: error.localizedDescription)
    Console.console.log(value: error, level: .verbose)
  }
}

// MARK: - PaymentMethodsProcessorApplePayPaymentRequestProvider
extension DemoPaymentMethodsWidgetViewModel: PaymentMethodsProcessorApplePayPaymentRequestProvider {
  func paymentRequest() -> PaymentRequest {
    PaymentRequest(
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
  }
}

// MARK: - PaymentMethodsProcessorBlikAuthorizationCodePresenter
extension DemoPaymentMethodsWidgetViewModel: PaymentMethodsProcessorBlikAuthorizationCodePresenter {
  func presentingViewController() -> UIViewController? {
    presenter?.presenterViewController
  }
}

