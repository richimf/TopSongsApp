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
  
  // MARK: - OVERRIDES
  override func viewDidLoad() {
    super.viewDidLoad()
    // VIPER VIEW CONNECTION
    Router.createModule(view: self)
    presenter?.getAlbums()
    // TABLE VIEW SETUP
    tableView.dataSource = self
    tableView.delegate = self
    tableView.separatorStyle = .none
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = rowHeight
    tableView.register(AlbumCell.self, forCellReuseIdentifier: cellId)
    self.navigationController?.navigationBar.tintColor = AppColors().Main
  }
  
  override func loadView() {
    super.loadView()
    view.backgroundColor = .white
    setupTableView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
  // MARK: - PRIVATE METHODS
  private func setupTableView() {
    view.addSubview(tableView)
    tableView.setupAnchorWithSafeArea(container: self.view, safeArea: view.layoutMarginsGuide)
  }
  
  // MARK: - VIEW PROTOCOL METHODS
  func loadAlbums() {
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
  
  func showError() {
    let alert = Utils.showAlert(title: "Error", message: "Request failed")
    DispatchQueue.main.async {
      self.present(alert, animated: true)
    }
  }
}

// MARK: - EXTENSIONS
extension ViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter?.data?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return rowHeight
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let selectedData = presenter?.data?[indexPath.row] else { return }
    presenter?.showDetail(data: selectedData, from: self)
    self.tableView.deselectRow(at: indexPath, animated: true)
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId,
                                                   for: indexPath) as? AlbumCell else { return UITableViewCell() }
    let data = presenter?.data?[indexPath.row]
    let image = presenter?.downloadImage(url: data?.artworkUrl100) { self.reloadRowAt(indexPath) }
    cell.set(album: data?.name, artist: data?.artistName, cover: image)
    return cell
  }
  
  private func reloadRowAt(_ indexPath: IndexPath) {
    self.tableView.beginUpdates()
    self.tableView.reloadRows( at: [indexPath], with: .fade)
    self.tableView.endUpdates()
  }
}

