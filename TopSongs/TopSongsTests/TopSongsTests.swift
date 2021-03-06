//
//  TopSongsTests.swift
//  TopSongsTests
//
//  Created by Ricardo Montesinos on 08/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import XCTest
@testable import TopSongs

class TopSongsTests: XCTestCase {
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testAlert() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let alert = Utils.showAlert(title: "", message: "")
    XCTAssertNotNil(alert)
  }
  
  func testAlertWithCompletion() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let alert = Utils.showAlert(title: "", message: "", completion: nil)
    XCTAssertNotNil(alert)
  }

}
