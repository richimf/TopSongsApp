//
//  Interactor.swift
//  TopSongsTests
//
//  Created by Ricardo Montesinos on 10/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit
@testable import TopSongs

class InteractorSpy: NSObject, InteractorInputProtocol {
  var presenter: InteractorOutputProtocol?
  
  func getAlbums() {
  }
  
  func downloadImage(url: String?, completion: @escaping () -> Void) -> UIImage? {
    return nil
  }

  func showError() {
    presenter?.showError()
  }
  
  func updateData() {
    presenter?.updateData(data: [])
  }
}
