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
  
  private let gotoItunesButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .red
    button.layer.cornerRadius = 10.0
    button.clipsToBounds = true
    return button
  }()
  
  private let albumNameLabel: LabelTextAlingment = {
    let lbl = LabelTextAlingment()
    lbl.textColor = .black
    lbl.numberOfLines = 0
    lbl.font = UIFont.boldSystemFont(ofSize: 18)
    lbl.textAlignment = .left
    return lbl
  }()
  
  private let genreLabel: LabelTextAlingment = {
     let lbl = LabelTextAlingment()
     lbl.numberOfLines = 0
     lbl.font = UIFont.systemFont(ofSize: 18)
     lbl.textAlignment = .left
     return lbl
   }()
  
  private let releaseDateLabel: LabelTextAlingment = {
    let lbl = LabelTextAlingment()
    lbl.numberOfLines = 0
    lbl.font = UIFont.systemFont(ofSize: 16)
    lbl.textAlignment = .left
    return lbl
  }()
  
  private let copyrightLabel: LabelTextAlingment = {
    let lbl = LabelTextAlingment()
    lbl.numberOfLines = 0
    lbl.font = UIFont.italicSystemFont(ofSize: 14)
    lbl.textAlignment = .left
    return lbl
  }()
  
  // MARK: - OVERRIDES
  override func viewDidLoad() {
    super.viewDidLoad()
    albumNameLabel.text = data?.artistName
    //genreLabel.text! = data?.genres.flatMap{ $0.name }
    releaseDateLabel.text = data?.releaseDate
    copyrightLabel.text = data?.copyright
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

    //Anchors
    let margins = self.view.safeAreaLayoutGuide
    albumImage.translatesAutoresizingMaskIntoConstraints = false
    albumImage.topAnchor.constraint(equalTo: margins.topAnchor, constant: 40.0).isActive = true
    albumImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    albumImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
    albumImage.heightAnchor.constraint(equalTo: albumImage.widthAnchor).isActive = true
    
    // Album Info
    let stackView = UIStackViewAnchor(arrangedSubviews: [albumNameLabel, genreLabel, releaseDateLabel, copyrightLabel])
    stackView.distribution = .fillProportionally
    stackView.axis = .vertical
    stackView.spacing = 3
    self.view.addSubview(stackView)
    let stackAnchor = Anchor(top: albumImage.bottomAnchor, left: albumImage.leftAnchor, bottom: nil, right: nil)
    let stackPadding = Padding(top: 5, left: 5, bottom: 5, right: 5)
    stackView.anchor(anchor: stackAnchor, padding: stackPadding, width: 200, height: 0, enableInsets: false)
    
    // Button
    gotoItunesButton.translatesAutoresizingMaskIntoConstraints = false
    gotoItunesButton.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
    gotoItunesButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20.0).isActive = true
    gotoItunesButton.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 20.0).isActive = true
    gotoItunesButton.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -20.0).isActive = true
  }
  
  func setData(data: MusicData) {
    self.data = data
  }
}
