//
//  Protocols.swift
//  TopSongs
//
//  Created by Ricardo Montesinos on 08/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit

protocol DownloadImageProtocol {
  func getAlbums()
  func downloadImage(url: String?, completion: @escaping () -> Void) -> UIImage?
}

protocol DetailViewProtocol {
  func showDetail(data: MusicData, from view: UIViewController)
}

// MARK: - VIPER Protocols
protocol ViewProtocol: class {
  var presenter: PresenterProtocol? { get set}
  // PRESENTER -> VIEW
  func loadAlbums()
}

protocol PresenterProtocol: class, DownloadImageProtocol, DetailViewProtocol {
  var view: ViewProtocol? { get set }
  var interactor: InteractorInputProtocol? { get set}
  var router: RouterProtocol? { get set }
  // VIEW -> PRESENTER
  var data: [MusicData]? { get set }
}

protocol InteractorInputProtocol: class, DownloadImageProtocol {
  var presenter: InteractorOutputProtocol? { get set}
  // PRESENTER -> INTERACTOR
}

protocol InteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
  func updateData(data: [MusicData])
}

protocol RouterProtocol: class, DetailViewProtocol {
  // PRESENTER -> ROUTER
}
