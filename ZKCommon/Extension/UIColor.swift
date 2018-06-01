//
//  UIColor.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import UIKit

/// UIColor
public extension UIColor {
    public final class zk {
        /// 根据 rgb 构建颜色
        public static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
            return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
        }
        /// 根据 rgb 和透明度构建颜色
        public static func rgbAlpha(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
            return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
        }
    }
}