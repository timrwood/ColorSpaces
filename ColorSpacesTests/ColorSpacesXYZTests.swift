//
//  ColorSpacesXYZTests.swift
//  ColorSpaces
//
//  Created by Tim Wood on 10/4/15.
//  Copyright © 2015 Tim Wood. All rights reserved.
//

import XCTest
@testable import ColorSpaces

class ColorSpacesXYZTests: XCTestCase {
    func testXYZToRGBX() {
        let xyz = XYZColor(x: 1, y: 0, z: 0, alpha: 1)
        let rgb = xyz.toRGB()
        XCTAssertEqualWithAccuracy(rgb.r, 1.643056, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(rgb.g, -0.990608, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(rgb.b, 0.297374, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(rgb.alpha, 1, accuracy: 1e-4)
    }
    
    func testXYZToRGBY() {
        let xyz = XYZColor(x: 0, y: 1, z: 0, alpha: 1)
        let rgb = xyz.toRGB()
        XCTAssertEqualWithAccuracy(rgb.r, -1.233843, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(rgb.g, 1.328345, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(rgb.b, -0.515835, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(rgb.alpha, 1, accuracy: 1e-4)
    }
    
    func testXYZToRGBZ() {
        let xyz = XYZColor(x: 0, y: 0, z: 1, alpha: 1)
        let rgb = xyz.toRGB()
        XCTAssertEqualWithAccuracy(rgb.r, -0.729141, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(rgb.g, 0.201117, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(rgb.b, 1.160669, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(rgb.alpha, 1, accuracy: 1e-4)
    }
    
    func testXYZToLABX() {
        let xyz = XYZColor(x: 1, y: 0, z: 0, alpha: 1)
        let lab = xyz.toLAB()
        XCTAssertEqualWithAccuracy(lab.l, 0, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(lab.a, 437.1441, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(lab.b, 0, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(lab.alpha, 1, accuracy: 1e-4)
    }
    
    func testXYZToLABY() {
        let xyz = XYZColor(x: 0, y: 1, z: 0, alpha: 1)
        let lab = xyz.toLAB()
        XCTAssertEqualWithAccuracy(lab.l, 100.0000, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(lab.a, -431.0345, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(lab.b, 172.4138, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(lab.alpha, 1, accuracy: 1e-4)
        XCTAssertEqual(lab.alpha, 1)
    }
    
    func testXYZToLABZ() {
        let xyz = XYZColor(x: 0, y: 0, z: 1, alpha: 1)
        let lab = xyz.toLAB()
        XCTAssertEqualWithAccuracy(lab.l, 0, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(lab.a, 0, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(lab.b, -185.6406, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(lab.alpha, 1, accuracy: 1e-4)
    }
    
    func testXYZLerp() {
        let a = XYZColor(x: 0, y: 1, z: 2, alpha: 0.1)
        let b = XYZColor(x: 7, y: 8, z: 9, alpha: 0.9)
        let half = a.lerp(b, t: 0.5)
        let quarter = a.lerp(b, t: 0.25)
        
        XCTAssertEqualWithAccuracy(half.x, 3.5, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(half.y, 4.5, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(half.z, 5.5, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(half.alpha, 0.5, accuracy: 1e-8)
        
        XCTAssertEqualWithAccuracy(quarter.x, 1.75, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(quarter.y, 2.75, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(quarter.z, 3.75, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(quarter.alpha, 0.3, accuracy: 1e-8)
    }
}
