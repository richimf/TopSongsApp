//
//  APIClien.swift
//  TopSongs
//
//  Created by Ricardo Montesinos on 09/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import Foundation

protocol APIResponseProtocol: class {
  func fetched(response: Response)
  func error()
}

class APIClient {
  
  var delegate: APIResponseProtocol?
  
  func getTopSongs() {
    let session = URLSession.shared
    guard let url = URL(string: APIUrls.albums.rawValue) else { return }
    let task = session.dataTask(with: url, completionHandler: { data, response, error in
      if error != nil {
        self.delegate?.error()
        return
      }
      // Serialize the data into an object
      do {
        if let data = data {
          let responseData = try JSONDecoder().decode(Response.self, from: data)
          self.delegate?.fetched(response: responseData)
        }
      } catch {
        self.delegate?.error()
      }
    })
    task.resume()
  }
}
