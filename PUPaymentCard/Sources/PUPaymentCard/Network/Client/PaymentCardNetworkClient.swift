//
//  PaymentCardNetworkClient.swift
//  
//  Created by PayU S.A. on 14/12/2022.
//  Copyright © 2022 PayU S.A. All rights reserved.
//

import Foundation
import PUAPI
import PUCore

protocol PaymentCardNetworkClientProtocol {
  func tokenize(
    tokenCreateRequest: TokenCreateRequest,
    completionHandler: @escaping (Result<TokenCreateResponse.Result, Error>) -> Void)
}

struct PaymentCardNetworkClient: PaymentCardNetworkClientProtocol {
  
  // MARK: - Private Properties
  private let client: NetworkClientProtocol

  // MARK: - Initialization
  init(client: NetworkClientProtocol) {
    self.client = client
  }
  
  // MARK: - PaymentCardNetworkClientProtocol
  func tokenize(
    tokenCreateRequest: TokenCreateRequest,
    completionHandler: @escaping (Result<TokenCreateResponse.Result, Error>) -> Void) {

      client.request(
        target: PaymentCardNetworkTarget.tokenize(tokenCreateRequest),
        type: TokenCreateResponse.self) { result in
          switch result {
            case .success(let response):
              response.data != nil
              ? completionHandler(.success(response.data!))
              : completionHandler(.failure(NetworkClientError(status: response.status)))

            case .failure(let error):
              completionHandler(.failure(error))
          }
        }
    }
}
