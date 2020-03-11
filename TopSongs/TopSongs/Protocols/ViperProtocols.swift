//
//  Protocols.swift
//  TopSongs
//
//  Created by Ricardo Montesinos on 08/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit

protocol DownloadImageProtocol {
  func downloadImage(url: String?, completion: @escaping () -> Void) -> UIImage?
}

// MARK: - VIPER Protocols
protocol ViewProtocol: class {
  var presenter: PresenterProtocol? { get set}
  // PRESENTER -> VIEW
  func loadAlbums()
}

protocol PresenterProtocol: class, DownloadImageProtocol {
  var view: ViewProtocol? { get set }
  var interactor: InteractorInputProtocol? { get set}
  var router: RouterProtocol? { get set }
  // VIEW -> PRESENTER
  var data: [MusicData]? { get set }
  func getAlbums()
  func showDetail(data: MusicData, from view: UIViewController)
}

protocol InteractorInputProtocol: class, DownloadImageProtocol {
  var presenter: InteractorOutputProtocol? { get set}
  // PRESENTER -> INTERACTOR
  func getAlbums()
}

protocol InteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
  func updateData(data: [MusicData])
}

protocol RouterProtocol: class {
  // PRESENTER -> ROUTER
  func showDetail(data: MusicData, from view: UIViewController)
}
