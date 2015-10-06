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
}
