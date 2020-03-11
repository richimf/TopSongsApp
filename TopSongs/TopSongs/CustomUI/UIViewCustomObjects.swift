//
//  UIViewCustomObjects.swift
//  TopSongs
//
//  Created by Ricardo Montesinos on 10/03/20.
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
