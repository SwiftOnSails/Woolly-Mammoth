//
//  Woolly_MammothTests.swift
//  Woolly MammothTests
//
//  Created by Boris Bügling on 26/10/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

import Cocoa
import Woolly_Mammoth
import XCTest

class Woolly_MammothTests: XCTestCase {
    func testJaroWinkler() {
        let distance = JaroWinklerDistance("typoed", "tpoed")
        XCTAssertTrue(abs(distance - 0.95) <= FLT_EPSILON, "Distance is wrong")
    }
}
