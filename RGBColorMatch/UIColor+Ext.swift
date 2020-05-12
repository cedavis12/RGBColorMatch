//
//  UIColor+Ext.swift
//  RGBColorMatch
//
//  Created by Courtney Davis on 5/11/20.
//  Copyright © 2020 Courtney Davis. All rights reserved.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1)
        print(randomColor)
        return randomColor
    }
}
