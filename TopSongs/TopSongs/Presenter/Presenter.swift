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
  
  func showDetail(data: MusicData, from view: UIViewController) {
    router?.showDetail(data: data, from: view)
  }
}
extension Presenter: InteractorOutputProtocol {
  
}
