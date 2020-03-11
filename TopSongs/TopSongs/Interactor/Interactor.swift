//
//  Interactor.swift
//  TopSongs
//
//  Created by Ricardo Montesinos on 08/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit

class Interactor: InteractorInputProtocol {

  // MARK: - VIPER
  weak var presenter: InteractorOutputProtocol?
  private let apiClient = APIClient()
  private let imageDownloader = ImageDownloader()
  
  func getAlbums() {
    apiClient.delegate = self
    apiClient.getTopSongs()
  }
  
  func downloadImage(url: String?, completion: @escaping () -> Void) -> UIImage? {
    guard let url = url else { return nil }
    if let image = imageDownloader.getSavedImageWith(key: url as NSString) {
      completion()
      return image
    }
    return imageDownloader.loadCompressedImage(from: url, completion: completion)
  }
}
extension Interactor: APIResponseProtocol {

  func fetched(response: Response) {
    guard let albums = response.feed.results else { return }
    presenter?.updateData(data: albums)
  }

  func error() {
    presenter?.showError()
  }
}
