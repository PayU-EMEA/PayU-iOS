//
//  Assembler.swift
//  
//  Created by PayU S.A. on 09/03/2023.
//  Copyright © 2022 PayU S.A. All rights reserved.
//

import Foundation
import PUAPI
import PUCore

final class Assembler {

  func makeCVVAuthorizationTextFormatter() -> TextFormatterProtocol {
    TextFormatterFactory().makeCVV()
  }

  func makeCVVAuthorizationPresenter() -> CVVAuthorizationPresenter {
    CVVAuthorizationPresenter(formatter: makeCVVAuthorizationTextFormatter())
  }

  func makeCVVAuthorizationNetworkClient() -> CVVAuthorizationNetworkClient {
    CVVAuthorizationNetworkClient(client: makeNetworkClient())
  }

  func makeCVVAuthorizationRepository() -> CVVAuthorizationRepository {
    CVVAuthorizationRepository(client: makeCVVAuthorizationNetworkClient())
  }

  func makeCVVAuthorizationService() -> CVVAuthorizationService {
    CVVAuthorizationService(
      presenter: makeCVVAuthorizationPresenter(),
      repository: makeCVVAuthorizationRepository())
  }

  func makeNetworkClient() -> NetworkClient {
    NetworkClient.Factory().make()
  }

  func makeWebPaymentsUrlMatcherFactory() -> WebPaymentsUrlMatcherFactory {
    WebPaymentsUrlMatcherFactory()
  }

  func makePaymentsViewController(request: WebPaymentsRequest) -> WebPaymentsViewController {
    WebPaymentsViewController(viewModel: makeWebPaymentsViewModel(request: request))
  }

  func makeWebPaymentsViewModel(request: WebPaymentsRequest) -> WebPaymentsViewModel {
    WebPaymentsViewModel(
      matcher: makeWebPaymentsUrlMatcherFactory().make(for: request),
      request: request)
  }
}
