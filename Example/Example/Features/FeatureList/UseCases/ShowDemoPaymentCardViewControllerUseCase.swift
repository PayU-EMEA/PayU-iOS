//
//  ShowDemoAddCardPageUseCase.swift
//  Example
//
//  Created by PayU S.A. on 12/12/2022.
//  Copyright © 2022 PayU S.A. All rights reserved.
//

import UIKit
import PUPaymentCard
import PUCore

final class ShowDemoPaymentCardViewControllerUseCase {
  private weak var presenter: UIViewController?
  private let settingsRepository = SettingsRepository()

  init(presenter: UIViewController? = nil) {
    self.presenter = presenter
  }

  func execute() {
    let configuration = PaymentCardViewController.Configuration(
      shouldDisplayExampleCards: settingsRepository.shouldDisplayExampleCards(),
      shouldDisplayScanCardButton: settingsRepository.shouldDisplayScanCardButton())
    
    let viewController = PaymentCardViewController.Factory().make(configuration: configuration)
    let navigationController = UINavigationController(rootViewController: viewController)
    presenter?.present(navigationController, animated: true)
    viewController.delegate = self
  }
}

// MARK: - PaymentCardViewControllerDelegate
extension ShowDemoPaymentCardViewControllerUseCase: PaymentCardViewControllerDelegate {
  func paymentCardViewController(_ viewController: PaymentCardViewController, didComplete cardToken: CardToken) {
    viewController.navigationController?.dismiss(animated: true) { [weak self] in
      self?.presenter?.dialog(title: "cardToken", message: cardToken.value)
      print("[ShowDemoAddCardPageUseCase] didComplete: \(cardToken)")
    }
  }
}
