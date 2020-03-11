//
//  UIView+Extensions.swift
//  TopSongs
//
//  Created by Ricardo Montesinos on 08/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit

// MARK: - CUSTOM OBJECTS
class UIImageViewAnchor: UIImageView, ViewSizeProtocol {
  func arrangeCenterFrom(view: UIView, width: CGFloat, topDistance: CGFloat) {
    let margins = view.safeAreaLayoutGuide
    self.translatesAutoresizingMaskIntoConstraints = false
    self.topAnchor.constraint(equalTo: margins.topAnchor, constant: topDistance).isActive = true
    self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    self.widthAnchor.constraint(equalToConstant: width).isActive = true
    self.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true
  }
}
class UIStackViewAnchor: UIStackView, ViewSizeProtocol { }
class UITableViewSafeArea: UITableView, ViewSafeAreaProtocol { }
class UIBounceButton: UIButton, BounceButtonProtocol { }

// MARK: - VIEW ANCHOR SIZE PROTOCOL
protocol ViewSizeProtocol {
  func anchor(anchor: Anchor, padding: Padding?, width: CGFloat, height: CGFloat, enableInsets: Bool)
}
extension ViewSizeProtocol where Self: UIView {
  
  func anchor(anchor: Anchor, padding: Padding?, width: CGFloat, height: CGFloat, enableInsets: Bool) {

    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = anchor.top, let topPadding = padding?.top {
      self.topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
    }
    if let left = anchor.left, let leftPadding = padding?.left {
      self.leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
    }
    if let right = anchor.right, let rightPadding = padding?.right {
      self.rightAnchor.constraint(equalTo: right, constant: -rightPadding).isActive = true
    }
    if let bottom = anchor.bottom, let bottomPadding = padding?.bottom{
      self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
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

// MARK: - CELL SEPARATOR
protocol ViewWithSeparatorStyle {
  func showDivision()
}
extension ViewWithSeparatorStyle where Self: UIView {

  func showDivision() {
    var separator: UIView = UIView(frame: .zero)
    self.addSubview(separator)
    setupDivisor(view: &separator)
    separator.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  }
  
  private func setupDivisor(view: inout UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
    view.heightAnchor.constraint(equalToConstant: 1).isActive = true
    view.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    view.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    view.backgroundColor = AppColors().Main50
  }
}

//MARK: - BOUNCE BUTTON
protocol BounceButtonProtocol {
  func bounce()
}
extension BounceButtonProtocol where Self: UIButton {
  func bounce() {
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 0.4
    pulse.fromValue = 0.95
    pulse.toValue = 1.0
    pulse.autoreverses = false
    pulse.repeatCount = 1
    pulse.initialVelocity = 0.4
    pulse.damping = 1.0
    layer.add(pulse, forKey: "bounce")
  }
  
  func setupButtonAtBottom(view: UIView) {
    let margins = view.safeAreaLayoutGuide
    self.translatesAutoresizingMaskIntoConstraints = false
    self.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
    self.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20.0).isActive = true
    self.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 20.0).isActive = true
    self.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -20.0).isActive = true
  }
  
  func addSelector(_ target: Any?, action: Selector) {
    self.addTarget(target, action: action, for: .touchUpInside)
  }
}
