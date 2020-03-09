//
//  Interactor.swift
//  TopSongs
//
//  Created by Ricardo Montesinos on 08/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import Foundation

class Interactor: InteractorInputProtocol {
  
  // MARK: - VIPER
  weak var presenter: InteractorOutputProtocol?
  private let apiClient = APIClient()
  
  func getAlbums() {
    apiClient.delegate = self
    apiClient.getTopSongs()
  }
}
extension Interactor: APIResponseProtocol {

  func fetched(response: Response) {
    guard let albums = response.feed.results else { return }
    presenter?.updateData(data: albums)
  }

  func error() {
    print(#function)
  }
}
