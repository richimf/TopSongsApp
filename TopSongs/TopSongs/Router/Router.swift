//
//  Router.swift
//  TopSongs
//
//  Created by Ricardo Montesinos on 08/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit

class Router: RouterProtocol {
  
  typealias PresenterProtocols = PresenterProtocol & InteractorOutputProtocol
   
   class func createModule(view: ViewController) {
     let presenter: PresenterProtocols = Presenter()
     view.presenter = presenter
     view.presenter?.router = Router()
     view.presenter?.view = view
     view.presenter?.interactor = Interactor()
     view.presenter?.interactor?.presenter = presenter
   }
  
  func showDetail(data: MusicData, from view: UIViewController) {
    let vc = DetailViewController()
    vc.setData(data: data)
    view.navigationController?.pushViewController(vc, animated: true)
  }

}
