//
//  PULogoView.swift
//
//  Created by PayU S.A. on 21/11/2022.
//  Copyright © 2022 PayU S.A. All rights reserved.
//

import PUCore
import UIKit

public final class PULogoView: UIView {

  // MARK: - Private Properties
  private let imageView = PUImageView()

  // MARK: - Constants
  private struct Constants {
    static let dimension: CGFloat = 48.0
  }

  // MARK: - Public Properties
  public override var intrinsicContentSize: CGSize {
    return CGSize(
      width: Constants.dimension,
      height: Constants.dimension)
  }

  // MARK: - Initialization
  public convenience init() {
    self.init(frame: .zero)
  }

  public override init(frame: CGRect) {
    super.init(frame: frame)
    setupAppearance()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Private Methods
  private func setupAppearance() {
    addSubview(imageView)

    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    imageView.widthAnchor.constraint(equalToConstant: Constants.dimension).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: Constants.dimension).isActive = true
    imageView.brandImageProvider = .logo
  }
}

