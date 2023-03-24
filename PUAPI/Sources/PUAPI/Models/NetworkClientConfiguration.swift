//
//  NetworkClientConfiguration.swift
//  
//  Created by PayU S.A. on 14/12/2022.
//  Copyright © 2022 PayU S.A. All rights reserved.
//

import Foundation
import PUCore

struct NetworkClientConfiguration {

  // MARK: - Public Properties
  let baseUrl: URL

  // MARK: - Initialization
  init(environment: Environment) {
    switch environment {
      case .production:
        self.init(baseUrl: URL(string: "https://mobilesdk.secure.payu.com")!)
      case .sandbox:
        self.init(baseUrl: URL(string: "https://secure.snd.payu.com")!)
      case .sandboxBeta:
        self.init(baseUrl: URL(string: "https://secure.sndbeta.payu.com")!)
    }
  }

  private init(baseUrl: URL) {
    self.baseUrl = baseUrl
  }
}