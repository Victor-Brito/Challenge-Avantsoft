//
//  Challenge_AvantsoftTests.swift
//  Challenge AvantsoftTests
//
//  Created by Victor Brito on 29/11/23.
//

import XCTest
@testable import Challenge_Avantsoft

final class Challenge_AvantsoftTests: XCTestCase {

    ///O método setUpWithError é o primeiro a ser rodado, por isso definimos o número 0, pois como salvamos no userdefaults números maior que 0 o próximo teste iria falhar
    override func setUpWithError() throws {
        UserDefaults.standard.set( 0, forKey: "heartCount")
        UserDefaults.standard.set( 0, forKey: "fireCount")
    }
    
    ///Com base no método passado este teste verifica se o count inicial é igual a 0
    func testInitialCountsAreZero() {
        let reactionsModel = ReactionsModel()
        XCTAssertEqual(reactionsModel.heartCount, 0)
        XCTAssertEqual(reactionsModel.fireCount, 0)
    }

    ///Neste teste fazemos a verificação se o "initialHeartCount" está sendo incrementado, caso queira testar basta comentar a linha 30 e veremos que o teste irá falhar, pois não fará o incremento
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


}
