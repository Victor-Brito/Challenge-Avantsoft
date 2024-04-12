//
//  Challenge_AvantsoftTests.swift
//  Challenge AvantsoftTests
//
//  Created by Victor Brito on 29/11/23.
//

import XCTest
@testable import Challenge_Avantsoft

final class Challenge_AvantsoftTests: XCTestCase {
    
    /// The setUpWithError method is the first one to run, so we set the number 0, because since we save numbers greater than 0 in userdefaults, the next test would fail
    override func setUpWithError() throws {
        UserDefaults.standard.set(0, forKey: "heartCount")
        UserDefaults.standard.set(0, forKey: "fireCount")
    }
    
    /// Based on the previous method, this test verifies if the initial count is equal to 0
    func testInitialCountsAreZero() {
        let reactionsModel = ReactionsModel()
        XCTAssertEqual(reactionsModel.heartCount, 0)
        XCTAssertEqual(reactionsModel.fireCount, 0)
    }
    
    /// In this test, we verify if the "initialHeartCount" is being incremented, if you want to test, just comment out line 30 and we'll see that the test will fail because it won't do the increment
    func testIncrementHeart() {
        var reactionsModel = ReactionsModel()
        let initialHeartCount = reactionsModel.heartCount
        reactionsModel.incrementHeart()
        XCTAssertEqual(reactionsModel.heartCount, initialHeartCount + 1)
    }
    
    func testIncrementFire() {
        var reactionsModel = ReactionsModel()
        let initialFireCount = reactionsModel.fireCount
        reactionsModel.incrementFire()
        XCTAssertEqual(reactionsModel.fireCount, initialFireCount + 1)
    }
    
    func testUserDefaultsUpdated() {
        var reactionsModel = ReactionsModel()
        
        // Save initial counts
        let initialHeartCount = reactionsModel.heartCount
        let initialFireCount = reactionsModel.fireCount
        
        // Increment counts
        reactionsModel.incrementHeart()
        reactionsModel.incrementFire()
        
        // Retrieve counts from UserDefaults
        let updatedHeartCount = UserDefaults.standard.integer(forKey: "heartCount")
        let updatedFireCount = UserDefaults.standard.integer(forKey: "fireCount")
        
        XCTAssertEqual(updatedHeartCount, initialHeartCount + 1)
        XCTAssertEqual(updatedFireCount, initialFireCount + 1)
    }
    
    func testParseValidJSON() {
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "data", withExtension: "json") else {
            XCTFail("Missing valid_data.json file")
            return
        }
        
        let result: Looks? = Parser.parseJson(url: url)
        
        // Verify if 4 looks were decoded from JSON
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.looks.count, 4)
    }
    
}

