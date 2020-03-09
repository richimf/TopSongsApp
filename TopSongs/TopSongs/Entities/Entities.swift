//
//  Entities.swift
//  TopSongs
//
//  Created by Ricardo Montesinos on 08/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit

struct Padding {
  let top: CGFloat?
  let left: CGFloat?
  let bottom: CGFloat?
  let right: CGFloat?
}

struct Anchor {
  let top: NSLayoutYAxisAnchor?
  let left: NSLayoutXAxisAnchor?
  let bottom: NSLayoutYAxisAnchor?
  let right: NSLayoutXAxisAnchor?
}

struct MusicData: Codable {
  let name: String
  let artistName: String
  let collectionName: String
  let releaseDate: String
  let artworkUrl100: String
  let genres: [Genre]
  let url: String
}

struct Genre: Codable {
  let genreId: String
  let name: String
  let url: String
}
