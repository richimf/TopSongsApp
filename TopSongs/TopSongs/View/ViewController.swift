//
//  ViewController.swift
//  TopSongs
//
//  Created by Ricardo Montesinos on 08/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewProtocol {
  
  // MARK: - PROPERTIES
  private let tableView: UITableViewSafeArea = UITableViewSafeArea()
  private let cellId: String = "cellId"
  private let rowHeight: CGFloat = 110
  
  // MARK: - VIPER
  var presenter: PresenterProtocol?
  
  // DATA
  var albumsData = ["Machine Gun - Live at the Fillmore East, NY", "Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon","Dark side of the Moon"]
  
  // MARK: - OVERRIDES
  override func viewDidLoad() {
    super.viewDidLoad()
    // VIPER VIEW CONNECTION
    Router.createModule(view: self)
    // TABLE VIEW SETUP
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = rowHeight
    tableView.register(AlbumCell.self, forCellReuseIdentifier: cellId)
  }
  
  override func loadView() {
    super.loadView()
    view.backgroundColor = .white
    setupTableView()
  }
  
  // MARK: - PRIVATE METHODS
  private func setupTableView() {
    view.addSubview(tableView)
    tableView.setupAnchorWithSafeArea(container: self.view, safeArea: view.layoutMarginsGuide)
  }
}

// MARK: - EXTENSIONS
extension ViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return albumsData.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return rowHeight
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // TODO SET CORRECT DATA
    let data = MusicData(name: "Song name",
                         artistName: "artist name sent",
                         collectionName: "collection",
                         releaseDate: "Date",
                         artworkUrl100: "", genres: [], url: "")
    presenter?.showDetail(data: data, from: self)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? AlbumCell else { return UITableViewCell() }
    // TODO Remove this
    let image = UIImage(named: "testAlbum")!
    cell.set(album: albumsData[indexPath.row], artist: "Artist name here, yes in this field", cover: image)
    return cell
  }
}

