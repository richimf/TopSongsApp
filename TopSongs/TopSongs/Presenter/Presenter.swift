//
//  Presenter.swift
//  TopSongs
//
//  Created by Ricardo Montesinos on 08/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit

class Presenter: PresenterProtocol {

  weak var view: ViewProtocol?
  var interactor: InteractorInputProtocol?
  var router: RouterProtocol?
  
  var data: [MusicData]?
  
  func showDetail(data: MusicData, from view: UIViewController) {
    router?.showDetail(data: data, from: view)
  }
  
  func getAlbums() {
    interactor?.getAlbums()
  }
  
  func downloadImage(url: String?, completion: @escaping () -> Void) -> UIImage? {
    guard let url = url else { return nil }
    return interactor?.downloadImage(url: url, completion: completion)
  }
}
extension Presenter: InteractorOutputProtocol {
  func updateData(data: [MusicData]) {
    self.data = data
    view?.loadAlbums()
  }
}
