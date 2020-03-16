//
//  DSATest.swift
//  DSATest1Tests
//
//  Created by Lynk on 3/12/20.
//  Copyright © 2020 Lynk. All rights reserved.
//

import XCTest
@testable import DSATest1

class DSATest: XCTestCase {

    let dsaTest = DSA()
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMultiply () {
        XCTAssert(dsaTest.multiply(x: 5, y: 10) == 50, "5 * 10 = 50")
        XCTAssert(dsaTest.multiply(x: 1, y: 235) == 235, "1 * 235 = 235")
        XCTAssert(dsaTest.multiply(x: -5, y: 18) == -90)
    }

}
