//
//  LABColor.swift
//  ColorSpaces
//
//  Created by Tim Wood on 10/5/15.
//  Copyright © 2015 Tim Wood. All rights reserved.
//

import UIKit

struct LABColor {
    let l, a, b, alpha: CGFloat
    
    func toXYZ() -> XYZColor {
        let fy = (l + 16) / 116
        let fz = fy - (b / 200)
        let fx = fy + (a / 500)
        let fx3 = fx * fx * fx
        let fz3 = fz * fz * fz
        let x = fx3 > LAB_E ? fx3 : (116 * fx - 16) / LAB_K
        let z = fz3 > LAB_E ? fx3 : (116 * fz - 16) / LAB_K
        let y = l > LAB_EK ? pow((l + 16) / 116, 3) : l / LAB_K
        return XYZColor(x: x * 0.96422, y: y, z: z * 0.82521, alpha: alpha)
    }
    
    func toLCH() -> LCHColor {
        let c = sqrt(a * a + b * b)
        let angle = atan2(b, a) * RAD_TO_DEG
        let h = angle < 0 ? angle + 360 : angle
        return LCHColor(l: l, c: c, h: h, alpha: alpha)
    }
}