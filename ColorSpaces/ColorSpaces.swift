//
//  ColorSpaces.swift
//  ColorSpaces
//
//  Created by Tim Wood on 10/9/15.
//  Copyright © 2015 Tim Wood. All rights reserved.
//

import UIKit

// MARK: - Constants

private let RAD_TO_DEG = 180 / CGFloat(M_PI)

private let LAB_E: CGFloat = 0.008856
private let LAB_16_116: CGFloat = 0.1379310
private let LAB_K_116: CGFloat = 7.787036
private let LAB_X: CGFloat = 0.95047
private let LAB_Y: CGFloat = 1
private let LAB_Z: CGFloat = 1.08883

// MARK: - RGB

public struct RGBColor {
    public let r: CGFloat     // 0..1
    public let g: CGFloat     // 0..1
    public let b: CGFloat     // 0..1
    public let alpha: CGFloat // 0..1
    
    public init (r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.r = r
        self.g = g
        self.b = b
        self.alpha = alpha
    }

    fileprivate func sRGBCompand(_ v: CGFloat) -> CGFloat {
        let absV = abs(v)
        let out = absV > 0.04045 ? pow((absV + 0.055) / 1.055, 2.4) : absV / 12.92
        return v > 0 ? out : -out
    }
    
    public func toXYZ() -> XYZColor {
        let R = sRGBCompand(r)
        let G = sRGBCompand(g)
        let B = sRGBCompand(b)
        let x: CGFloat = (R * 0.4124564) + (G * 0.3575761) + (B * 0.1804375)
        let y: CGFloat = (R * 0.2126729) + (G * 0.7151522) + (B * 0.0721750)
        let z: CGFloat = (R * 0.0193339) + (G * 0.1191920) + (B * 0.9503041)
        return XYZColor(x: x, y: y, z: z, alpha: alpha)
    }
    
    public func toLAB() -> LABColor {
        return toXYZ().toLAB()
    }
    
    public func toLCH() -> LCHColor {
        return toXYZ().toLCH()
    }
    
    public func color() -> UIColor {
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    
    public func lerp(_ other: RGBColor, t: CGFloat) -> RGBColor {
        return RGBColor(
            r: r + (other.r - r) * t,
            g: g + (other.g - g) * t,
            b: b + (other.b - b) * t,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}

public extension UIColor {
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

// MARK: - XYZ

public struct XYZColor {
    public let x: CGFloat     // 0..0.95047
    public let y: CGFloat     // 0..1
    public let z: CGFloat     // 0..1.08883
    public let alpha: CGFloat // 0..1
    
    public init (x: CGFloat, y: CGFloat, z: CGFloat, alpha: CGFloat) {
        self.x = x
        self.y = y
        self.z = z
        self.alpha = alpha
    }

    fileprivate func sRGBCompand(_ v: CGFloat) -> CGFloat {
        let absV = abs(v)
        let out = absV > 0.0031308 ? 1.055 * pow(absV, 1 / 2.4) - 0.055 : absV * 12.92
        return v > 0 ? out : -out
    }
    
    public func toRGB() -> RGBColor {
        let r = (x *  3.2404542) + (y * -1.5371385) + (z * -0.4985314)
        let g = (x * -0.9692660) + (y *  1.8760108) + (z *  0.0415560)
        let b = (x *  0.0556434) + (y * -0.2040259) + (z *  1.0572252)
        let R = sRGBCompand(r)
        let G = sRGBCompand(g)
        let B = sRGBCompand(b)
        return RGBColor(r: R, g: G, b: B, alpha: alpha)
    }
    
    fileprivate func labCompand(_ v: CGFloat) -> CGFloat {
        return v > LAB_E ? pow(v, 1.0 / 3.0) : (LAB_K_116 * v) + LAB_16_116
    }
    
    public func toLAB() -> LABColor {
        let fx = labCompand(x / LAB_X)
        let fy = labCompand(y / LAB_Y)
        let fz = labCompand(z / LAB_Z)
        return LABColor(
            l: 116 * fy - 16,
            a: 500 * (fx - fy),
            b: 200 * (fy - fz),
            alpha: alpha
        )
    }
    
    public func toLCH() -> LCHColor {
        return toLAB().toLCH()
    }
    
    public func lerp(_ other: XYZColor, t: CGFloat) -> XYZColor {
        return XYZColor(
            x: x + (other.x - x) * t,
            y: y + (other.y - y) * t,
            z: z + (other.z - z) * t,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}

// MARK: - LAB

public struct LABColor {
    public let l: CGFloat     //    0..100
    public let a: CGFloat     // -128..128
    public let b: CGFloat     // -128..128
    public let alpha: CGFloat //    0..1
    
    public init (l: CGFloat, a: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.l = l
        self.a = a
        self.b = b
        self.alpha = alpha
    }

    fileprivate func xyzCompand(_ v: CGFloat) -> CGFloat {
        let v3 = v * v * v
        return v3 > LAB_E ? v3 : (v - LAB_16_116) / LAB_K_116
    }
    
    public func toXYZ() -> XYZColor {
        let y = (l + 16) / 116
        let x = y + (a / 500)
        let z = y - (b / 200)
        return XYZColor(
            x: xyzCompand(x) * LAB_X,
            y: xyzCompand(y) * LAB_Y,
            z: xyzCompand(z) * LAB_Z,
            alpha: alpha
        )
    }
    
    public func toLCH() -> LCHColor {
        let c = sqrt(a * a + b * b)
        let angle = atan2(b, a) * RAD_TO_DEG
        let h = angle < 0 ? angle + 360 : angle
        return LCHColor(l: l, c: c, h: h, alpha: alpha)
    }
    
    public func toRGB() -> RGBColor {
        return toXYZ().toRGB()
    }
    
    public func lerp(_ other: LABColor, t: CGFloat) -> LABColor {
        return LABColor(
            l: l + (other.l - l) * t,
            a: a + (other.a - a) * t,
            b: b + (other.b - b) * t,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}

// MARK: - LCH

public struct LCHColor {
    public let l: CGFloat     // 0..100
    public let c: CGFloat     // 0..128
    public let h: CGFloat     // 0..360
    public let alpha: CGFloat // 0..1
    
    public init (l: CGFloat, c: CGFloat, h: CGFloat, alpha: CGFloat) {
        self.l = l
        self.c = c
        self.h = h
        self.alpha = alpha
    }

    public func toLAB() -> LABColor {
        let rad = h / RAD_TO_DEG
        let a = cos(rad) * c
        let b = sin(rad) * c
        return LABColor(l: l, a: a, b: b, alpha: alpha)
    }
    
    public func toXYZ() -> XYZColor {
        return toLAB().toXYZ()
    }
    
    public func toRGB() -> RGBColor {
        return toXYZ().toRGB()
    }
    
    public func lerp(_ other: LCHColor, t: CGFloat) -> LCHColor {
        let angle = (((((other.h - h).truncatingRemainder(dividingBy: 360)) + 540).truncatingRemainder(dividingBy: 360)) - 180) * t
        return LCHColor(
            l: l + (other.l - l) * t,
            c: c + (other.c - c) * t,
            h: (h + angle + 360).truncatingRemainder(dividingBy: 360),
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}
