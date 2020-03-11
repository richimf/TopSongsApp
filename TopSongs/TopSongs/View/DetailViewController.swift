//
//  DetailViewController.swift
//  TopSongs
//
//  Created by Ricardo Montesinos on 08/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  private var data: MusicData?
  private let imageDownloader = ImageDownloader()
  
  private var albumImage: UIImageViewAnchor = {
    let imgView: UIImageViewAnchor = UIImageViewAnchor()
    imgView.contentMode = .scaleAspectFit
    return imgView
  }()
  
  private let gotoItunesButton: UIBounceButton = {
    let button = UIBounceButton()
    button.backgroundColor = AppColors().Main
    button.setTitle("Open in iTunes", for: .normal)
    button.layer.cornerRadius = 10.0
    button.clipsToBounds = true
    button.isHidden = true
    return button
  }()
  
  private let albumNameLabel: UILabelAlingment = {
    let lbl = UILabelAlingment()
    return lbl.setup(size: .huge, isBold: true)
  }()
  
  private let artistNameLabel: UILabelAlingment = {
    let lbl = UILabelAlingment()
    return lbl.setup(size: .big, isBold: true)
  }()
  
  private let genreLabel: UILabelAlingment = {
    let lbl = UILabelAlingment()
    return lbl.setup(size: .big)
  }()
  
  private let releaseDateLabel: UILabelAlingment = {
    let lbl = UILabelAlingment()
    return lbl.setup(size: .regular)
  }()
  
  private let copyrightLabel: UILabelAlingment = {
    let lbl = UILabelAlingment()
    lbl.numberOfLines = 0
    lbl.font = UIFont.italicSystemFont(ofSize: 14)
    lbl.textAlignment = .left
    return lbl
  }()
  
  // MARK: - OVERRIDES
  override func viewDidLoad() {
    super.viewDidLoad()
    albumNameLabel.text = data?.name
    artistNameLabel.text = data?.artistName
    releaseDateLabel.text = data?.releaseDate
    copyrightLabel.text = data?.copyright
    setGenres()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    loadAlbumCover()
  }
  
  private func setGenres() {
    let genres = data?.genres?.compactMap { $0.name }
    var genresOutput = ""
    genres?.forEach { genresOutput += $0 }
    genreLabel.text = genresOutput
  }
  
  private func loadAlbumCover() {
    guard let urlArt = data?.artworkUrl100 else { return }
    DispatchQueue.main.async {
      self.albumImage.image = self.imageDownloader.retreiveImage(url: urlArt)
    }
  }
  
  override func loadView() {
    super.loadView()
    self.view.backgroundColor = .white
    self.view.addSubview(albumImage)
    self.view.addSubview(gotoItunesButton)
    // Anchors
    setupAlbumCoverConstraints()
    // Album Info
    setupAlbumInfoStack()
    // iTUNES BUTTON
    setupiTunesButtonConstraints()
  }
  
  func setData(data: MusicData) {
    self.data = data
  }
  
  // MARK: ALBUM SETUP
  private func setupAlbumCoverConstraints() {
    albumImage.arrangeCenterFrom(view: self.view, width: 200, topDistance: 40.0)
  }
  
  // MARK: ALBUM INFO
  private func setupAlbumInfoStack() {
    let stackView = UIStackViewAnchor(arrangedSubviews: [albumNameLabel, artistNameLabel, genreLabel, releaseDateLabel, copyrightLabel])
    stackView.distribution = .fillProportionally
    stackView.axis = .vertical
    stackView.spacing = 3
    self.view.addSubview(stackView)
    let stackAnchor = Anchor(top: albumImage.bottomAnchor, left: albumImage.leftAnchor, bottom: nil, right: nil)
    let stackPadding = Padding(top: 5, left: 5, bottom: 5, right: 5)
    stackView.anchor(anchor: stackAnchor, padding: stackPadding, width: 200, height: 0, enableInsets: false)
  }
  
  // MARK: BUTTON SETUP
  private func setupiTunesButtonConstraints() {
    gotoItunesButton.setupButtonAtBottom(view: self.view)
    if let url = data?.url, !url.isEmpty {
      gotoItunesButton.isHidden = false
      gotoItunesButton.addSelector(self, action: #selector(openLink))
    }
  }
  
  @objc func openLink() {
    gotoItunesButton.bounce()
    guard let path = data?.url, let url = URL(string: path) else { return }
    showAlert { _ in UIApplication.shared.open(url) }
  }
  
  private func showAlert(completion: ((UIAlertAction) -> Void)? = nil) {
    let alert = Utils.showAlert(title: "External Link",
                                message: "Do you want to open the iTunes link of this album?",
                                completion: completion)
    self.present(alert, animated: true)
  }
}
