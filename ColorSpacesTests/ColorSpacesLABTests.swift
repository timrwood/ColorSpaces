//
//  ColorSpacesLABTests.swift
//  ColorSpaces
//
//  Created by Tim Wood on 10/5/15.
//  Copyright © 2015 Tim Wood. All rights reserved.
//

import XCTest
@testable import ColorSpaces

class ColorSpacesLABTests: XCTestCase {
    func testLABToXYZL() {
        let lab = LABColor(l: 1, a: 0, b: 0, alpha: 1)
        let xyz = lab.toXYZ()
        XCTAssertLessThan(abs(xyz.x - 0.001067), 0.000001, "\(xyz.x) ~= 0.001067")
        XCTAssertLessThan(abs(xyz.y - 0.001107), 0.000001, "\(xyz.y) ~= 0.001107")
        XCTAssertLessThan(abs(xyz.z - 0.000914), 0.000001, "\(xyz.z) ~= 0.000914")
        XCTAssertEqual(xyz.alpha, 1)
    }
    
    func testLABToXYZA() {
        let lab = LABColor(l: 0, a: 1, b: 0, alpha: 1)
        let xyz = lab.toXYZ()
        XCTAssertLessThan(abs(xyz.x - 0.000248), 0.000001, "\(xyz.x) ~= 0.000248")
        XCTAssertLessThan(abs(xyz.y - 0), 0.000001, "\(xyz.y) ~= 0")
        XCTAssertLessThan(abs(xyz.z - 0), 0.000001, "\(xyz.z) ~= 0")
        XCTAssertEqual(xyz.alpha, 1)
    }
    
    func testLABToXYZB() {
        let lab = LABColor(l: 0, a: 0, b: 1, alpha: 1)
        let xyz = lab.toXYZ()
        XCTAssertLessThan(abs(xyz.x - 0), 0.000001, "\(xyz.x) ~= 0")
        XCTAssertLessThan(abs(xyz.y - 0), 0.000001, "\(xyz.y) ~= 0")
        XCTAssertLessThan(abs(xyz.z + 0.000530), 0.000001, "\(xyz.z) ~= 0.000530")
        XCTAssertEqual(xyz.alpha, 1)
    }
    
    func testLABToLCHL() {
        let lab = LABColor(l: 1, a: 2, b: 3, alpha: 1)
        let lch = lab.toLCH()
        XCTAssertLessThan(abs(lch.l - 1), 0.000001, "\(lch.l) ~= 1")
        XCTAssertLessThan(abs(lch.c - 3.6055512), 0.000001, "\(lch.c) ~= 3.6056")
        XCTAssertLessThan(abs(lch.h - 56.3099324), 0.000001, "\(lch.h) ~= 56.3099324")
        XCTAssertEqual(lch.alpha, 1)
    }
    
    func testLABToLCHA() {
        let lab = LABColor(l: 3, a: -2, b: -1, alpha: 1)
        let lch = lab.toLCH()
        XCTAssertLessThan(abs(lch.l - 3), 0.000001, "\(lch.l) ~= 3")
        XCTAssertLessThan(abs(lch.c - 2.23606797), 0.000001, "\(lch.c) ~= 2.2361")
        XCTAssertLessThan(abs(lch.h - 206.56505117), 0.000001, "\(lch.h) ~= 206.5651")
        XCTAssertEqual(lch.alpha, 1)
    }
}
