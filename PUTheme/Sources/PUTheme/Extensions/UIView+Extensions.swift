//
//  UIView+Extensions.swift
//
//  Created by PayU S.A. on 15/11/2022.
//  Copyright © 2022 PayU S.A. All rights reserved.
//  

import UIKit

extension UIButton {
  public func apply(style: PUTheme.ElevatedButtonTheme.Style) {
    self.titleLabel?.apply(style: style.textStyle)
    self.backgroundColor = style.backgroundColor
    self.layer.cornerRadius = style.borderStyle.radius
    self.layer.borderWidth = style.borderStyle.width
    self.layer.borderColor = style.borderStyle.color.cgColor
    self.layer.masksToBounds = true
    self.setTitleColor(style.textStyle.color, for: [])
    self.imageView?.tintColor = style.textStyle.color
    self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -24, bottom: 0, right: 0)
  }
}

extension UILabel {
  public func apply(style: PUTheme.TextTheme.Style) {
    self.textColor = style.color
    self.font = UIFont.systemFont(
      ofSize: style.fontSize,
      weight: style.fontWeight)
  }
}

extension PUTextField {
  public func apply(style: PUTheme.TextInputTheme.Style) {
    borderLayer.backgroundColor = style.backgroundColor.cgColor
    borderLayer.borderColor = style.borderStyle.color.cgColor
    borderLayer.borderWidth = style.borderStyle.width
    borderLayer.cornerRadius = style.borderStyle.radius
    borderLayer.masksToBounds = true

    self.textColor = style.textStyle.color
    self.font = UIFont.systemFont(
      ofSize: style.textStyle.fontSize,
      weight: style.textStyle.fontWeight)
  }
}

extension UIView {
  public func apply(style: PUTheme.CardTheme.Style) {
    self.backgroundColor = style.backgroundColor
    self.layer.cornerRadius = style.borderStyle.radius
    self.layer.borderWidth = style.borderStyle.width
    self.layer.borderColor = style.borderStyle.color.cgColor
    self.layer.masksToBounds = true
  }
}
