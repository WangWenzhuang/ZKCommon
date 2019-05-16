//
//  UIColor.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import UIKit

public extension UIColor {
    final class zk {
        /// ZK: 根据 rgb 创建颜色
        ///
        /// - Parameters:
        ///   - r: r
        ///   - g: g
        ///   - b: b
        ///   - alpha: alpha，默认：1
        /// - Returns: UIColor
        public static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ alpha: CGFloat = 1) -> UIColor {
            return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
        }
    }
}
