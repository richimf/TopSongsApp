//
//  Protocols.swift
//  TopSongs
//
//  Created by Ricardo Montesinos on 08/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit

// MARK: - VIPER Protocols
protocol ViewProtocol: class {
  var presenter: PresenterProtocol? { get set}
  // PRESENTER -> VIEW
}

protocol PresenterProtocol: class {
  var view: ViewProtocol? { get set }
  var interactor: InteractorInputProtocol? { get set}
  var router: RouterProtocol? { get set }
  // VIEW -> PRESENTER
   func showDetail(data: MusicData, from view: UIViewController)
}

protocol InteractorInputProtocol: class {
  var presenter: InteractorOutputProtocol? { get set}
  // PRESENTER -> INTERACTOR
}

protocol InteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
}

protocol RouterProtocol: class {
  // PRESENTER -> ROUTER
  func showDetail(data: MusicData, from view: UIViewController)
}
