//
//  ColorSpacesLCHTests.swift
//  ColorSpaces
//
//  Created by Tim Wood on 10/6/15.
//  Copyright © 2015 Tim Wood. All rights reserved.
//

import XCTest
@testable import ColorSpaces

class ColorSpacesLCHTests: XCTestCase {
    func testLCHToLAB1() {
        let lch = LCHColor(l: 1, c: 2, h: 345, alpha: 1)
        let lab = lch.toLAB()
        XCTAssertEqualWithAccuracy(lab.l, 1, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(lab.a, 1.93185165, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(lab.b, -0.51763809, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(lch.alpha, 1, accuracy: 1e-6)
    }
    
    func testLCHToLAB2() {
        let lch = LCHColor(l: 100, c: 234, h: 56, alpha: 1)
        let lab = lch.toLAB()
        XCTAssertEqualWithAccuracy(lab.l, 100, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(lab.a, 130.85113941, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(lab.b, 193.99479197, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(lch.alpha, 1, accuracy: 1e-6)
    }
}
