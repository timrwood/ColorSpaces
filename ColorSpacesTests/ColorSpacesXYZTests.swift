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
        XCTAssertEqualWithAccuracy(rgb.r,  1.6668880, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(rgb.g, -0.9863667, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(rgb.b,  0.2615979, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(rgb.alpha, 1, accuracy: 1e-6)
    }
    
    func testXYZToRGBY() {
        let xyz = XYZColor(x: 0, y: 1, z: 0, alpha: 1)
        let rgb = xyz.toRGB()
        XCTAssertEqualWithAccuracy(rgb.r, -1.2069714, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(rgb.g,  1.3161990, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(rgb.b, -0.4890281, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(rgb.alpha, 1, accuracy: 1e-6)
    }
    
    func testXYZToRGBZ() {
        let xyz = XYZColor(x: 0, y: 0, z: 1, alpha: 1)
        let rgb = xyz.toRGB()
        XCTAssertEqualWithAccuracy(rgb.r, -0.7343888, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(rgb.g,  0.2253387, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(rgb.b,  1.0247476, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(rgb.alpha, 1, accuracy: 1e-6)
    }
    
    func testXYZToRGBAndBack() {
        let a = XYZColor(x: 0.123, y: 0.456, z: 0.789, alpha: 0.3)
        let b = a.toRGB().toXYZ()
        XCTAssertEqualWithAccuracy(a.x, b.x, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(a.y, b.y, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(a.z, b.z, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(a.alpha, b.alpha, accuracy: 1e-6)
    }
    
    func testXYZToLABX() {
        let xyz = XYZColor(x: 1, y: 0, z: 0, alpha: 1)
        let lab = xyz.toLAB()
        XCTAssertEqualWithAccuracy(lab.l, 0, accuracy: 1e-5)
        XCTAssertEqualWithAccuracy(lab.a, 439.5730164, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(lab.b, 0, accuracy: 1e-5)
        XCTAssertEqualWithAccuracy(lab.alpha, 1, accuracy: 1e-6)
    }
    
    func testXYZToLABY() {
        let xyz = XYZColor(x: 0, y: 1, z: 0, alpha: 1)
        let lab = xyz.toLAB()
        XCTAssertEqualWithAccuracy(lab.l, 100, accuracy: 1e-5)
        XCTAssertEqualWithAccuracy(lab.a, -431.0344827, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(lab.b, 172.4137931, accuracy: 1e-5)
        XCTAssertEqualWithAccuracy(lab.alpha, 1, accuracy: 1e-5)
        XCTAssertEqual(lab.alpha, 1)
    }
    
    func testXYZToLABZ() {
        let xyz = XYZColor(x: 0, y: 0, z: 1, alpha: 1)
        let lab = xyz.toLAB()
        XCTAssertEqualWithAccuracy(lab.l, 0, accuracy: 1e-5)
        XCTAssertEqualWithAccuracy(lab.a, 0, accuracy: 1e-5)
        XCTAssertEqualWithAccuracy(lab.b, -166.8199296, accuracy: 1e-5)
        XCTAssertEqualWithAccuracy(lab.alpha, 1, accuracy: 1e-6)
    }
    
    func testXYZToLABAndBack() {
        let a = XYZColor(x: 0.123, y: 0.456, z: 0.789, alpha: 0.3)
        let b = a.toLAB().toXYZ()
        XCTAssertEqualWithAccuracy(a.x, b.x, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(a.y, b.y, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(a.z, b.z, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(a.alpha, b.alpha, accuracy: 1e-6)
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
