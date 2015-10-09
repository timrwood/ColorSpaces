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
    
    func testCreatingUIColorFromRGB() {
        let rgb = RGBColor(r: 0.1, g: 0.2, b: 0.3, alpha: 0.4)
        let color = rgb.color()
        XCTAssertEqual(color, UIColor(red: 0.1, green: 0.2, blue: 0.3, alpha: 0.4))
    }
    
    func testRGBToXYZRed() {
        let rgb = RGBColor(r: 1, g: 0, b: 0, alpha: 1)
        let xyz = rgb.toXYZ()
        XCTAssertEqualWithAccuracy(xyz.x, 0.4124564, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.y, 0.2126729, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.z, 0.0193339, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.alpha, 1, accuracy: 1e-6)
    }
    
    func testRGBToXYZGreen() {
        let rgb = RGBColor(r: 0, g: 1, b: 0, alpha: 1)
        let xyz = rgb.toXYZ()
        XCTAssertEqualWithAccuracy(xyz.x, 0.3575761, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.y, 0.7151522, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.z, 0.1191920, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.alpha, 1, accuracy: 1e-6)
    }
    
    func testRGBToXYZBlue() {
        let rgb = RGBColor(r: 0, g: 0, b: 1, alpha: 1)
        let xyz = rgb.toXYZ()
        XCTAssertEqualWithAccuracy(xyz.x, 0.1804375, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.y, 0.0721750, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.z, 0.9503041, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(xyz.alpha, 1, accuracy: 1e-6)
    }
    
    func testRGBToXYZAndBack() {
        let a = RGBColor(r: 0.123, g: 0.456, b: 0.789, alpha: 1)
        let b = a.toXYZ().toRGB()
        XCTAssertEqualWithAccuracy(a.r, b.r, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(a.g, b.g, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(a.b, b.b, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(a.alpha, b.alpha, accuracy: 1e-6)
    }
    
    func testRGBToLAB() {
        let original = RGBColor(r: 0.123, g: 0.456, b: 0.789, alpha: 0.3)
        let manual = original.toXYZ().toLAB()
        let direct = original.toLAB()
        XCTAssertEqualWithAccuracy(manual.l, direct.l, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(manual.a, direct.a, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(manual.b, direct.b, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(manual.alpha, direct.alpha, accuracy: 1e-6)
    }
    
    func testRGBToLCH() {
        let original = RGBColor(r: 0.123, g: 0.456, b: 0.789, alpha: 0.3)
        let manual = original.toXYZ().toLAB().toLCH()
        let direct = original.toLCH()
        XCTAssertEqualWithAccuracy(manual.l, direct.l, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(manual.c, direct.c, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(manual.h, direct.h, accuracy: 1e-6)
        XCTAssertEqualWithAccuracy(manual.alpha, direct.alpha, accuracy: 1e-6)
    }
    
    func testRGBLerp() {
        let a = RGBColor(r: 0, g: 0.5, b: 1, alpha: 0.1)
        let b = RGBColor(r: 0.2, g: 0.2, b: 0.2, alpha: 0.9)
        let half = a.lerp(b, t: 0.5)
        let quarter = a.lerp(b, t: 0.25)
        
        XCTAssertEqualWithAccuracy(half.r, 0.10, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(half.g, 0.35, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(half.b, 0.60, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(half.alpha, 0.5, accuracy: 1e-8)
        
        XCTAssertEqualWithAccuracy(quarter.r, 0.050, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(quarter.g, 0.425, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(quarter.b, 0.800, accuracy: 1e-8)
        XCTAssertEqualWithAccuracy(quarter.alpha, 0.3, accuracy: 1e-8)
    }
}
