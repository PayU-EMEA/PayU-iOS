//
//  Bundle+Extensions.swift
//  
//  Created by PayU S.A. on 21/12/2022.
//  Copyright © 2022 PayU S.A. All rights reserved.
//

import Foundation

extension Bundle {
  static func bundle(languageCode: String) -> Bundle {
    guard let path = Bundle.module.path(
      forResource: languageCode,
      ofType: "lproj")
    else { return .module }
    return Bundle(path: path) ?? .module
  }
}
