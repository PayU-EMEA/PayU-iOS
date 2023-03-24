//
//  PaymentMethodsWidgetViewModel.swift
//
//  Created by PayU S.A. on 23/11/2022.
//  Copyright © 2022 PayU S.A. All rights reserved.
//

import PUCore
import UIKit

protocol PaymentMethodsWidgetViewModelDelegate: AnyObject {
  func viewModel(_ viewModel: PaymentMethodsWidgetViewModel, didUpdateState state: PaymentMethodsWidgetState)
  func viewModel(_ viewModel: PaymentMethodsWidgetViewModel, shouldPresentPaymentMethods configuration: PaymentMethodsConfiguration, storage: PaymentMethodsStorageProtocol?)
}

final class PaymentMethodsWidgetViewModel {

  // MARK: - Public Properties
  weak var delegate: PaymentMethodsWidgetViewModelDelegate?

  var paymentMethod: PaymentMethod? { modifiedPaymentMethod() }
  private(set) var state: PaymentMethodsWidgetState = .initial
  private(set) var blikAuthorizationCode: String?
  private(set) var selectedPaymentMethod: PaymentMethod?

  // MARK: - Private Properties
  private let configuration: PaymentMethodsConfiguration
  private let storage: PaymentMethodsStorageProtocol?
  private let textFormatter: TextFormatterProtocol

  // MARK: - Initialization
  init(
    configuration: PaymentMethodsConfiguration,
    storage: PaymentMethodsStorageProtocol?,
    textFormatter: TextFormatterProtocol
  ) {
    self.configuration = configuration
    self.storage = storage
    self.textFormatter = textFormatter
  }

  // MARK: - Public Methods
  func didTapWidget() {
    delegate?.viewModel(self, shouldPresentPaymentMethods: configuration, storage: storage)
  }

  func didTapEnterNewBlikCode() {
    Console.console.log(value: nil, level: .verbose)
    guard let paymentMethod = selectedPaymentMethod else { return }
    updateWidgetState(.blikToken(paymentMethod))
    delegate?.viewModel(self, didUpdateState: state)
  }

  func didEnterNewBlikCode(_ text: String) {
    let blikCode = formattedBlikAuthorizationCode(text)
    blikAuthorizationCode = blikCode.isBlikCode ? blikCode : nil
    Console.console.log(value: blikAuthorizationCode, level: .verbose)
  }

  func didSelect(_ paymentMethod: PaymentMethod?) {
    updatePaymentMethod(paymentMethod)
    updateWidgetState()
    delegate?.viewModel(self, didUpdateState: state)
  }

  func didDelete(_ paymentMethod: PaymentMethod) {
    if self.selectedPaymentMethod?.value == paymentMethod.value {
      didSelect(nil)
    }
  }

  func formattedBlikAuthorizationCode(_ text: String) -> String {
    textFormatter.formatted(text)
  }

  // MARK: - Private Methods
  private func modifiedPaymentMethod() -> PaymentMethod? {
    guard let selectedPaymentMethod = selectedPaymentMethod else { return nil }

    switch selectedPaymentMethod {
      case is ApplePay:
        return selectedPaymentMethod

      case let blikCode as BlikCode:
        return blikCode.copyWith(authorizationCode: blikAuthorizationCode)

      case is BlikToken:
        return selectedPaymentMethod

      case is CardToken:
        return selectedPaymentMethod

      case is Installments:
        return selectedPaymentMethod

      case is PayByLink:
        return selectedPaymentMethod

      default:
        return selectedPaymentMethod
    }
  }

  private func updatePaymentMethod(_ paymentMethod: PaymentMethod?) {
    self.selectedPaymentMethod = paymentMethod
  }

  private func updateWidgetState(_ state: PaymentMethodsWidgetState? = nil) {
    guard state == nil else {
      self.state = state!
      return
    }

    guard let paymentMethod = selectedPaymentMethod else {
      self.state = .initial
      return
    }

    switch paymentMethod {
      case is BlikCode:
        self.state = .blikCode(paymentMethod)
      case is BlikToken:
        self.state = .blikToken(paymentMethod)
      default:
        self.state = .paymentMethod(paymentMethod)
    }
  }
}
