//
//  ColorSpacesTests.swift
//  ColorSpacesTests
//
//  Created by Tim Wood on 10/4/15.
//  Copyright © 2015 Tim Wood. All rights reserved.
//

import XCTest
@testable import ColorSpaces

class ColorSpacesRGBTests: XCTestCase {
    func testCreatingRGBFromUIColor() {
        let color = UIColor(red: 0, green: 0.25, blue: 0.5, alpha: 0.75)
        let rgb = color.rgbColor()!
        XCTAssertEqual(rgb.r, 0)
        XCTAssertEqual(rgb.g, 0.25)
        XCTAssertEqual(rgb.b, 0.5)
        XCTAssertEqual(rgb.alpha, 0.75)
    }
    
    func testRGBToXYZRed() {
        let rgb = RGBColor(r: 1, g: 0, b: 0, alpha: 1)
        let xyz = rgb.toXYZ()
        XCTAssertEqualWithAccuracy(xyz.x, 0.436075, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(xyz.y, 0.222504, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(xyz.z, 0.013932, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(xyz.alpha, 1, accuracy: 1e-4)
    }
    
    func testRGBToXYZGreen() {
        let rgb = RGBColor(r: 0, g: 1, b: 0, alpha: 1)
        let xyz = rgb.toXYZ()
        XCTAssertEqualWithAccuracy(xyz.x, 0.385065, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(xyz.y, 0.716879, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(xyz.z, 0.097105, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(xyz.alpha, 1, accuracy: 1e-4)
    }
    
    func testRGBToXYZBlue() {
        let rgb = RGBColor(r: 0, g: 0, b: 1, alpha: 1)
        let xyz = rgb.toXYZ()
        XCTAssertEqualWithAccuracy(xyz.x, 0.143080, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(xyz.y, 0.060617, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(xyz.z, 0.714173, accuracy: 1e-4)
        XCTAssertEqualWithAccuracy(xyz.alpha, 1, accuracy: 1e-4)
    }
}
