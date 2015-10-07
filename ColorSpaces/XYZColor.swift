//
//  XYZColor.swift
//  ColorSpaces
//
//  Created by Tim Wood on 10/4/15.
//  Copyright © 2015 Tim Wood. All rights reserved.
//

import UIKit

struct XYZColor {
    let x, y, z, alpha: CGFloat

    func toRGB() -> RGBColor {
        let r = (x * 3.1338561) + (y * -1.6168667) + (z * -0.4906146)
        let g = (x * -0.9787684) + (y * 1.9161415) + (z * 0.0334540)
        let b = (x * 0.0719453) + (y * -0.2289914) + (z * 1.4052427)
        let R = sRGBCompand(r)
        let G = sRGBCompand(g)
        let B = sRGBCompand(b)
        return RGBColor(r: R, g: G, b: B, alpha: alpha)
    }
    
    func toLAB() -> LABColor {
        let fx = labCompand(x / 0.96422)
        let fy = labCompand(y)
        let fz = labCompand(z / 0.82521)
        let l = 116 * fy - 16
        let a = 500 * (fx - fy)
        let b = 200 * (fy - fz)
        return LABColor(l: l, a: a, b: b, alpha: alpha)
    }
}

private func labCompand(v: CGFloat) -> CGFloat {
    return v > 0.008856 ? pow(v, 1.0 / 3.0) : (903.29629  * v + 16) / 116
}

private func sRGBCompand(v: CGFloat) -> CGFloat {
    let sign: CGFloat = v > 0 ? 1 : -1
    let absV = abs(v)
    let out = absV > 0.0031308 ? 1.055 * pow(absV, 1 / 2.4) - 0.055 : absV * 12.92
    return out * sign
}
