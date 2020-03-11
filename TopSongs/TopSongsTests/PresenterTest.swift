//
//  Presenter.swift
//  TopSongsTests
//
//  Created by Ricardo Montesinos on 10/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import XCTest
@testable import TopSongs

class PresenterTest: XCTestCase {
  
  var presenter: Presenter? = {
    return Presenter()
  }()
  
  var viewSpy: ViewControllerSpy? = ViewControllerSpy()
  var routerSpy: RouterSpy? = RouterSpy()
  var interactorSpy: InteractorSpy? = InteractorSpy()
  let musicData = MusicData(name: "Name",
                            artistName: "Artist",
                            releaseDate: "10/03/20",
                            artworkUrl100: "URL",
                            genres: nil,
                            copyright: "copyright",
                            url: "")
  
  override func setUp() {
    presenter?.view = viewSpy
    presenter?.router = routerSpy
    interactorSpy?.presenter = PresenterSpy()
    presenter?.interactor = interactorSpy
  }
  
  override func tearDown() {
    presenter = nil
    viewSpy = nil
    interactorSpy = nil
  }
  
  func testGetAlbums() {
    interactorSpy?.getAlbums()
  }
  
  func testDownloadImage() {
    // downloadImage(url: String?, completion: @escaping () -> Void
    presenter?.downloadImage(url: "", completion: {})
  }
  
  func testShowErrors() {
    presenter?.showError()
  }
  
  func testShowDetail() {
    guard let view = viewSpy else { return }
    presenter?.showDetail(data: musicData, from: view)
  }
  
  func testShowErrorView() {
    interactorSpy?.showError()
  }
  
  func testUpdateData() {
    interactorSpy?.updateData()
  }
  
  func testShowDetailView() {
    guard let view = viewSpy else { return }
    routerSpy?.showDetail(data: musicData, from: view)
    //viewSpy?.showDetailView(data: musicData, view: viewSpy)
  }
  
  func testLoadingAlbumsError() {
    viewSpy?.showError()
  }
  
}

class PresenterSpy: NSObject, InteractorOutputProtocol {
  func updateData(data: [MusicData]) {
    print("Data retreived")
  }
  
  func showError() {
    print("Error")
  }
}
