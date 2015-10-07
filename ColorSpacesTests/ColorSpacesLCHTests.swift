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
        XCTAssertLessThan(abs(lab.l - 1), 0.000001, "\(lab.l) ~= 1")
        XCTAssertLessThan(abs(lab.a - 1.93185165), 0.000001, "\(lab.a) ~= 1.931851652")
        XCTAssertLessThan(abs(lab.b + 0.51763809), 0.000001, "\(lab.b) ~= -0.51763809")
        XCTAssertEqual(lch.alpha, 1)
    }
    
    func testLCHToLAB2() {
        let lch = LCHColor(l: 100, c: 234, h: 56, alpha: 1)
        let lab = lch.toLAB()
        XCTAssertLessThan(abs(lab.l - 100), 0.000001, "\(lab.l) ~= 100")
        XCTAssertLessThan(abs(lab.a - 130.85113941), 0.000001, "\(lab.a) ~= 130.85113941")
        XCTAssertLessThan(abs(lab.b - 193.99479197), 0.000001, "\(lab.b) ~= 193.99479197")
        XCTAssertEqual(lch.alpha, 1)
    }
}
