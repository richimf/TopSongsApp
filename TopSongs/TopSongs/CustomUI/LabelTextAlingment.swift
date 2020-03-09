//
//  UILabel+Extensions.swift
//  TopSongs
//
//  Created by Ricardo Montesinos on 08/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit

class LabelTextAlingment: UILabel {

  override func drawText(in rect: CGRect) {
    var newRect = rect
    switch contentMode {
    case .top:
      newRect.size.height = sizeThatFits(rect.size).height
    case .bottom:
      let height = sizeThatFits(rect.size).height
      newRect.origin.y += rect.size.height - height
      newRect.size.height = height
    default:
      ()
    }
    super.drawText(in: newRect)
  }
}
