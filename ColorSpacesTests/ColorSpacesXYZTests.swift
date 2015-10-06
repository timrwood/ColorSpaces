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
        XCTAssertLessThan(abs(rgb.r - 1.643056), 0.0001, "\(rgb.r) ~= 1.643056")
        XCTAssertLessThan(abs(rgb.g + 0.990608), 0.0001, "\(rgb.g) ~= -0.990608")
        XCTAssertLessThan(abs(rgb.b - 0.297374), 0.0001, "\(rgb.b) ~= 0.297374")
        XCTAssertEqual(rgb.alpha, 1)
    }
    
    func testXYZToRGBY() {
        let xyz = XYZColor(x: 0, y: 1, z: 0, alpha: 1)
        let rgb = xyz.toRGB()
        XCTAssertLessThan(abs(rgb.r + 1.233843), 0.0001, "\(rgb.r) ~= -1.233843")
        XCTAssertLessThan(abs(rgb.g - 1.328345), 0.0001, "\(rgb.g) ~= 1.328345")
        XCTAssertLessThan(abs(rgb.b + 0.515835), 0.0001, "\(rgb.b) ~= -0.515835")
        XCTAssertEqual(rgb.alpha, 1)
    }
    
    func testXYZToRGBZ() {
        let xyz = XYZColor(x: 0, y: 0, z: 1, alpha: 1)
        let rgb = xyz.toRGB()
        XCTAssertLessThan(abs(rgb.r + 0.729141), 0.0001, "\(rgb.r) ~= -0.729141")
        XCTAssertLessThan(abs(rgb.g - 0.201117), 0.0001, "\(rgb.g) ~= 0.201117")
        XCTAssertLessThan(abs(rgb.b - 1.160669), 0.0001, "\(rgb.b) ~= 1.160669")
        XCTAssertEqual(rgb.alpha, 1)
    }
}
