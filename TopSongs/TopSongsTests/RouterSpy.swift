//
//  Router.swift
//  TopSongsTests
//
//  Created by Ricardo Montesinos on 10/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit
@testable import TopSongs

class RouterSpy: NSObject, RouterProtocol {

  func showDetail(data: MusicData, from view: UIViewController) {
    print("Detail View displayed")
  }  
}
