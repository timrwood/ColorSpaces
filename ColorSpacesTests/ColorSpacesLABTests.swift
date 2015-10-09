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
        XCTAssertEqualWithAccuracy(xyz.x, 0.001067, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.y, 0.001107, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.z, 0.000914, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.alpha, 1, accuracy: 1e-6)
    }
    
    func testLABToXYZA() {
        let lab = LABColor(l: 0, a: 1, b: 0, alpha: 1)
        let xyz = lab.toXYZ()
        XCTAssertEqualWithAccuracy(xyz.x, 0.000248, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.y, 0, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.z, 0, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.alpha, 1, accuracy: 1e-6)
    }
    
    func testLABToXYZB() {
        let lab = LABColor(l: 0, a: 0, b: 1, alpha: 1)
        let xyz = lab.toXYZ()
        XCTAssertEqualWithAccuracy(xyz.x, 0, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.y, 0, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.z, -0.000530, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.alpha, 1, accuracy: 1e-6)
    }
    
    func testLABToLCHL() {
        let lab = LABColor(l: 1, a: 2, b: 3, alpha: 1)
        let lch = lab.toLCH()
        XCTAssertEqualWithAccuracy(lch.l, 1, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(lch.c, 3.6055512, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(lch.h, 56.3099324, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(lch.alpha, 1, accuracy: 1e-6)
    }
    
    func testLABToLCHA() {
        let lab = LABColor(l: 3, a: -2, b: -1, alpha: 1)
        let lch = lab.toLCH()
        XCTAssertEqualWithAccuracy(lch.l, 3, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(lch.c, 2.23606797, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(lch.h, 206.56505117, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(lch.alpha, 1, accuracy: 1e-6)
    }
    
    func testLABLerp() {
        let a = LABColor(l: 10, a: -120, b: -40, alpha: 0.1)
        let b = LABColor(l: 90, a: 20, b: 90, alpha: 0.4)
        let half = a.lerp(b, t: 0.5)
        let quarter = a.lerp(b, t: 0.25)
        
        XCTAssertEqualWithAccuracy(half.l, 50, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(half.a, -50, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(half.b, 25, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(half.alpha, 0.25, accuracy: 1e-8)
        
        XCTAssertEqualWithAccuracy(quarter.l, 30, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(quarter.a, -85, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(quarter.b, -7.5, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(quarter.alpha, 0.175, accuracy: 1e-8)
    }
}
