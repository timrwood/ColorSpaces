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
        XCTAssertLessThan(abs(xyz.x - 0.436075), 0.0001, "\(xyz.x) ~= 0.436075")
        XCTAssertLessThan(abs(xyz.y - 0.222504), 0.0001, "\(xyz.y) ~= 0.222504")
        XCTAssertLessThan(abs(xyz.z - 0.013932), 0.0001, "\(xyz.z) ~= 0.013932")
        XCTAssertEqual(xyz.alpha, 1)
    }
    
    func testRGBToXYZGreen() {
        let rgb = RGBColor(r: 0, g: 1, b: 0, alpha: 1)
        let xyz = rgb.toXYZ()
        XCTAssertLessThan(abs(xyz.x - 0.385065), 0.0001, "\(xyz.x) ~= 0.385065")
        XCTAssertLessThan(abs(xyz.y - 0.716879), 0.0001, "\(xyz.y) ~= 0.716879")
        XCTAssertLessThan(abs(xyz.z - 0.097105), 0.0001, "\(xyz.z) ~= 0.097105")
        XCTAssertEqual(xyz.alpha, 1)
    }
    
    func testRGBToXYZBlue() {
        let rgb = RGBColor(r: 0, g: 0, b: 1, alpha: 1)
        let xyz = rgb.toXYZ()
        XCTAssertLessThan(abs(xyz.x - 0.143080), 0.0001, "\(xyz.x) ~= 0.143080")
        XCTAssertLessThan(abs(xyz.y - 0.060617), 0.0001, "\(xyz.y) ~= 0.060617")
        XCTAssertLessThan(abs(xyz.z - 0.714173), 0.0001, "\(xyz.z) ~= 0.714173")
        XCTAssertEqual(xyz.alpha, 1)
    }
}
