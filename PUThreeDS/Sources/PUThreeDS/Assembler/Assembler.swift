//
//  Assembler.swift
//  
//  Created by PayU S.A. on 11/01/2023.
//  Copyright © 2022 PayU S.A. All rights reserved.
//

import Foundation
import PUAPI
import PUCore

struct Assembler {

  func makeComponents() -> SoftAcceptComponents {
    SoftAcceptComponents()
  }

  func makeConfiguration() -> SoftAcceptConfiguration {
    SoftAcceptConfiguration
      .Factory(environment: PayU.pos.environment)
      .make()
  }

  func makeNetworkClient() -> NetworkClient {
    NetworkClient.Factory().make()
  }

  func makeQueryParameterExtractor() -> SoftAcceptQueryParameterExtractor {
    SoftAcceptQueryParameterExtractor()
  }

  func makeRepository() -> SoftAcceptRepository {
    SoftAcceptRepository(client: makeNetworkClient())
  }

  func makeService() -> SoftAcceptService {
    SoftAcceptService(
      components: makeComponents(),
      configuration: makeConfiguration(),
      extractor: makeQueryParameterExtractor(),
      repository: makeRepository(),
      urlModifier: makeUrlModifier())
  }

  func makeUrlModifier() -> SoftAcceptUrlModifier {
    SoftAcceptUrlModifier()
  }
}
