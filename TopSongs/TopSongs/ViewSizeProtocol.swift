//
//  UIView+Extensions.swift
//  TopSongs
//
//  Created by Ricardo Montesinos on 08/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit

// MARK: - CUSTOM OBJECTS
class UIImageViewAnchor: UIImageView, ViewSizeProtocol { }
class UIStackViewAnchor: UIStackView, ViewSizeProtocol {}
class UITableViewSafeArea: UITableView, ViewSafeAreaProtocol {}

// MARK: - VIEW ANCHOR SIZE PROTOCOL
protocol ViewSizeProtocol {
  func anchor(anchor: Anchor, padding: Padding?, width: CGFloat, height: CGFloat, enableInsets: Bool)
}
extension ViewSizeProtocol where Self: UIView {
  
  func anchor(anchor: Anchor, padding: Padding?, width: CGFloat, height: CGFloat, enableInsets: Bool) {
    
    let topInset = CGFloat.zero
    let bottomInset = CGFloat.zero
    
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = anchor.top, let topPadding = padding?.top {
      self.topAnchor.constraint(equalTo: top, constant: topPadding+topInset).isActive = true
    }
    if let left = anchor.left, let leftPadding = padding?.left {
      self.leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
    }
    if let right = anchor.right, let rightPadding = padding?.right {
      self.rightAnchor.constraint(equalTo: right, constant: -rightPadding).isActive = true
    }
    if let bottom = anchor.bottom, let bottomPadding = padding?.bottom{
      self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding-bottomInset).isActive = true
    }
    if height != 0 {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    if width != 0 {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }
  }
}

// MARK: - SAFE AREA PROTOCOL
protocol ViewSafeAreaProtocol {
  func setupAnchorWithSafeArea(container view: UIView, safeArea: UILayoutGuide)
}
extension ViewSafeAreaProtocol where Self: UIView {
  func setupAnchorWithSafeArea(container view: UIView, safeArea: UILayoutGuide) {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
    self.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    self.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
    self.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
  }
}
