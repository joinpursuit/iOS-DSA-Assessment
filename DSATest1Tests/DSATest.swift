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

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSum () {
        XCTAssert(DSA().sum(a: 1, b: 2) == 3, "Incorrect Sum")
    }

}
