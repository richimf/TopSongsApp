//
//  AlbumCell.swift
//  TopSongs
//
//  Created by Ricardo Montesinos on 08/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell, ViewWithSeparatorStyle {
    
  // MARK: - COMPUTED PROPERTIES
  private let albumImage: UIImageViewAnchor = {
    let imgView: UIImageViewAnchor = UIImageViewAnchor(image: UIImage(named: "empty"))
    imgView.contentMode = .scaleAspectFit
    imgView.clipsToBounds = true
    return imgView
  }()

  private let albumNameLabel: LabelTextAlingment = {
    let lbl = LabelTextAlingment()
    lbl.textColor = .black
    lbl.numberOfLines = 2
    lbl.font = UIFont.boldSystemFont(ofSize: 18)
    lbl.textAlignment = .left
    lbl.contentMode = .bottom
    return lbl
  }()

  private let artistNameLabel: LabelTextAlingment = {
    let lbl = LabelTextAlingment()
    lbl.textColor = .black
    lbl.numberOfLines = 0
    lbl.contentMode = .top
    lbl.font = UIFont.systemFont(ofSize: 15)
    lbl.textAlignment = .left
    return lbl
  }()

  // MARK: - OVERRIDES
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(albumImage)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: PRIVATE METHODS
  private func setupViews() {
    showDivision()
    setupAlbumCover()
    setupAlbumInfo()
  }
  
  private func setupAlbumCover() {
    let albumAnchor = Anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil)
    let albumPadding = Padding(top: 0, left: 15, bottom: 0, right: 0)
    albumImage.anchor(anchor: albumAnchor, padding: albumPadding, width: 90, height: 90, enableInsets: false)
  }
  
  private func setupAlbumInfo() {
    let stackView = UIStackViewAnchor(arrangedSubviews: [albumNameLabel, artistNameLabel])
    stackView.distribution = .fillEqually
    stackView.axis = .vertical
    stackView.spacing = 5
    addSubview(stackView)
    let stackAnchor = Anchor(top: topAnchor, left: albumImage.rightAnchor, bottom: bottomAnchor, right: rightAnchor)
    let stackPadding = Padding(top: 5, left: 15, bottom: 5, right: 10)
    stackView.anchor(anchor: stackAnchor, padding: stackPadding, width: 0, height: 100, enableInsets: false)
  }

  // MARK: CELL METHODS
  func set(album name: String?, artist: String?, cover image: UIImage?) {
    guard let name = name, let artist = artist, let image = image else { return }
    self.albumImage.image = image
    self.albumNameLabel.text = name
    self.artistNameLabel.text = artist
  }
}
