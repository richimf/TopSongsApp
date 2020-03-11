//
//  Utils.swift
//  TopSongs
//
//  Created by Ricardo Montesinos on 10/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit

final class Utils {
  static func showAlert(title: String,
                        message: String,
                        completion: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: completion))
    alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
    return alert
  }
}

