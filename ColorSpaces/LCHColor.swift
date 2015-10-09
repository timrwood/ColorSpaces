//
//  LCHColor.swift
//  ColorSpaces
//
//  Created by Tim Wood on 10/6/15.
//  Copyright © 2015 Tim Wood. All rights reserved.
//

import UIKit

struct LCHColor {
    let l, c, h, alpha: CGFloat
    
    func toLAB() -> LABColor {
        let rad = h / RAD_TO_DEG
        let a = cos(rad) * c
        let b = sin(rad) * c
        return LABColor(l: l, a: a, b: b, alpha: alpha)
    }
    
    func lerp(other: LCHColor, t: CGFloat) -> LCHColor {
        let diffH = other.h - h
        let destH: CGFloat
        
        if abs(diffH) > 180 {
            destH = (h + (diffH + 360) * t) % 360
        } else {
            destH = h + diffH * t
        }
        
        return LCHColor(
            l: l + (other.l - l) * t,
            c: c + (other.c - c) * t,
            h: destH,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}