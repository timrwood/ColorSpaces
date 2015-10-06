//
//  LABColor.swift
//  ColorSpaces
//
//  Created by Tim Wood on 10/5/15.
//  Copyright © 2015 Tim Wood. All rights reserved.
//

import UIKit

struct LABColor {
    let l: CGFloat
    let a: CGFloat
    let b: CGFloat
    let alpha: CGFloat
    
    func toXYZ() -> XYZColor {
        let fy = (l + 16) / 116
        let fz = fy - (b / 200)
        let fx = fy + (a / 500)
        let fx3 = fx * fx * fx
        let fz3 = fz * fz * fz
        let e: CGFloat = 0.008856
        let k: CGFloat = 903.3
        let x = fx3 > e ? fx3 : (116 * fx - 16) / k
        let z = fz3 > e ? fx3 : (116 * fz - 16) / k
        let y = l > e * k ? pow((l + 16) / 116, 3) : l / k
        return XYZColor(x: x * 0.96422, y: y, z: z * 0.82521, alpha: alpha)
    }
}