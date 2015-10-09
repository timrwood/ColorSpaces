//
//  RGBColor.swift
//  ColorSpaces
//
//  Created by Tim Wood on 10/4/15.
//  Copyright © 2015 Tim Wood. All rights reserved.
//

import UIKit

struct RGBColor {
    let r, g, b, alpha: CGFloat
    
    private func sRGBCompand(v: CGFloat) -> CGFloat {
        return v > 0.04045 ? pow((v + 0.055) / 1.055, 2.4) : v / 12.92
    }
    
    func toXYZ() -> XYZColor {
        let R = sRGBCompand(r)
        let G = sRGBCompand(g)
        let B = sRGBCompand(b)
        let x: CGFloat = (R * 0.4360747) + (G * 0.3850649) + (B * 0.1430804)
        let y: CGFloat = (R * 0.2225045) + (G * 0.7168786) + (B * 0.0606169)
        let z: CGFloat = (R * 0.0139322) + (G * 0.0971045) + (B * 0.7141733)
        return XYZColor(x: x, y: y, z: z, alpha: alpha)
    }
    
    func lerp(other: RGBColor, t: CGFloat) -> RGBColor {
        return RGBColor(
            r: r + (other.r - r) * t,
            g: g + (other.g - g) * t,
            b: b + (other.b - b) * t,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}

extension UIColor {
    func rgbColor() -> RGBColor? {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var alpha: CGFloat = 0
        if getRed(&r, green: &g, blue: &b, alpha: &alpha) {
            return RGBColor(r: r, g: g, b: b, alpha: alpha)
        } else {
            return nil
        }
    }
}