//
//  ViewController.swift
//  TopSongsTests
//
//  Created by Ricardo Montesinos on 10/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit
@testable import TopSongs

class ViewControllerSpy: UIViewController, ViewProtocol {
  var presenter: PresenterProtocol?
  
  func loadAlbums() {

  }
  
  func showError() {
  }
  
  func showDetailView(data: MusicData, view: UIViewController) {
    presenter?.showDetail(data: data, from: view)
  }
}
