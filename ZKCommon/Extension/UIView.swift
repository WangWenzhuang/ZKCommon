//
//  UIView.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/2/23.
//  Copyright © 2017年 北京亿和博嘉教育科技有限公司. All rights reserved.
//

import UIKit

public extension UIView {
    /// ZK: width
    var width: CGFloat {
        get {
            return frame.width
        } set {
            frame.size.width = newValue
        }
    }
    /// ZK: height
    var height: CGFloat {
        get {
            return frame.height
        } set {
            frame.size.height = newValue
        }
    }
    /// ZK: x
    var x: CGFloat {
        get {
            return frame.origin.x
        } set {
            frame.origin.x = newValue
        }
    }
    /// ZK: y
    var y: CGFloat {
        get {
            return frame.origin.y
        } set {
            frame.origin.y = newValue
        }
    }
    /// ZK: bottomY = y + height
    var bY: CGFloat {
        return height + y
    }
    /// ZK: rightX = width + x
    var rX: CGFloat {
        return width + x
    }
}
