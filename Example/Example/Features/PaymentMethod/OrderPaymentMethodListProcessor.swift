//
//  OrderPaymentMethodListProcessor.swift
//  Example
//
//  Created by PayU S.A. on 06/12/2022.
//  Copyright © 2022 PayU S.A. All rights reserved.
//  

import Foundation
import PUCore
import PUThreeDS
import PUWebPayments
import UIKit

final class OrderPaymentMethodListProcessor {

  // MARK: - Private Properties
  private weak var presentingViewController: UIViewController?
  private let cvvAuthorizationService = CVVAuthorizationService.Factory().make()
  private let softAcceptService = SoftAcceptService.Factory().make()
  private var alertViewController: UIAlertController?

  // MARK: - Initialization
  init(presentingViewController: UIViewController? = nil) {
    self.presentingViewController = presentingViewController

    self.cvvAuthorizationService.delegate = self
    self.cvvAuthorizationService.presentingViewController = presentingViewController
    self.softAcceptService.delegate = self
  }

  // MARK: - Public Methods
  func process(_ orderCreateResponse: OrderCreateResponse) {
    Console.console.log(value: orderCreateResponse, level: .verbose)
    orderCreateResponse.redirectUri == nil
    ? processWithoutRedirectUrl(orderCreateResponse)
    : processWithRedirectUrl(orderCreateResponse)
  }

  // MARK: - Private Methods
  private func processWithoutRedirectUrl(_ orderCreateResponse: OrderCreateResponse) {
    Console.console.log(value: orderCreateResponse, level: .verbose)
    presentingViewController?.dialog(title: "WebPaymentsResult", message: "status: \(orderCreateResponse.status.statusCode)")
  }

  private func processWithRedirectUrl(_ orderCreateResponse: OrderCreateResponse) {
    Console.console.log(value: orderCreateResponse, level: .verbose)

    switch orderCreateResponse.status.statusCode {
      case .success:
        processWebPayment(.payByLink, orderCreateResponse)

      case .warningContinue3DS:
        orderCreateResponse.iframeAllowed == true
        ? process3DS2Payment(orderCreateResponse.redirectUrl!)
        : processWebPayment(.threeDS, orderCreateResponse)

      case .warningContinueCVV:
        processCVVPayment(orderCreateResponse.redirectUrl!)

      case .warningContinueRedirect:
        processWebPayment(.payByLink, orderCreateResponse)
    }
  }

  private func process3DS2Payment(_ redirectUrl: URL) {
    let request = SoftAcceptRequest(redirectUrl: redirectUrl)
    softAcceptService.authenticate(request: request)
  }

  private func processCVVPayment(_ redirectUrl: URL) {
    let extractor = CVVAuthorizationExtractor()
    let refReqId = extractor.extractRefReqId(redirectUrl)!
    cvvAuthorizationService.authorize(refReqId: refReqId)
  }

  private func processWebPayment(_ requestType: WebPaymentsRequest.RequestType, _ orderCreateResponse: OrderCreateResponse) {
    let redirectUrl = URL(string: orderCreateResponse.redirectUri!)!
    let continueUrl = URL(string: Constants.Order.continueUrl)!
    let request = WebPaymentsRequest(requestType: requestType, redirectUrl: redirectUrl, continueUrl: continueUrl)
    let viewController = WebPaymentsViewController.Factory().make(request: request)
    let navigationController = UINavigationController(rootViewController: viewController)
    presentingViewController?.present(navigationController, animated: true)
    viewController.delegate = self
  }

}

// MARK: - WebPaymentsViewControllerDelegate
extension OrderPaymentMethodListProcessor: WebPaymentsViewControllerDelegate {
  func webPaymentsViewController(_ viewController: WebPaymentsViewController, didComplete result: WebPaymentsResult) {
    viewController.navigationController?.dismiss(animated: true) { [weak self] in
      guard let self = self else { return }

      self.presentingViewController?.dialog(title: "WebPaymentsResult", message: "status: \(result.status)")
      switch result.status {
        case .success:
          Console.console.log(value: result, level: .verbose)

        case .failure:
          Console.console.log(value: result, level: .verbose)

        case .cancelled:
          Console.console.log(value: result, level: .verbose)

        case .continue3DS:
          Console.console.log(value: result, level: .verbose)
          self.process3DS2Payment(result.url)

        case .continueCvv:
          Console.console.log(value: result, level: .verbose)
          self.processCVVPayment(result.url)

        case .externalApplication:
          Console.console.log(value: result, level: .verbose)
      }
    }
  }
}

// MARK: - CVVAuthorizationServiceDelegate
extension OrderPaymentMethodListProcessor: CVVAuthorizationServiceDelegate {
  func cvvAuthorizationService(_ service: CVVAuthorizationService, didComplete status: CVVAuthorizationResult) {
    Console.console.log(value: status, level: .verbose)
  }

  func cvvAuthorizationService(_ service: CVVAuthorizationService, didFail error: Error) {
    Console.console.log(value: error, level: .verbose)
  }
}

// MARK: - SoftAcceptServiceDelegate
extension OrderPaymentMethodListProcessor: SoftAcceptServiceDelegate {
  func softAcceptService(_ service: SoftAcceptService, didStartAuthentication request: SoftAcceptRequest) {
    Console.console.log(value: request, level: .verbose)
    alertViewController = UIAlertController(title: "SoftAccept", message: "Authenticating ...", preferredStyle: .alert)
    alertViewController?.addAction(.init(title: "Cancel", style: .cancel))
    presentingViewController?.present(alertViewController!, animated: true)
  }

  func softAcceptService(_ service: SoftAcceptService, didCompleteAuthentication status: SoftAcceptStatus) {
    Console.console.log(value: status, level: .verbose)
    alertViewController?.dismiss(animated: true)
    presentingViewController?.dialog(title: "didCompleteAuthentication", message: "\(status)")
  }
}
