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
    public var width: CGFloat {
        get {
            return frame.width
        } set {
            frame.size.width = newValue
        }
    }
    /// ZK: height
    public var height: CGFloat {
        get {
            return frame.height
        } set {
            frame.size.height = newValue
        }
    }
    /// ZK: x
    public var x: CGFloat {
        get {
            return frame.origin.x
        } set {
            frame.origin.x = newValue
        }
    }
    /// ZK: y
    public var y: CGFloat {
        get {
            return frame.origin.y
        } set {
            frame.origin.y = y
        }
    }
    /// ZK: bottomY = y + height
    public var bottomY: CGFloat {
        return height + y
    }
    /// ZK: rightX = width + x
    public var rightX: CGFloat {
        return width + x
    }
}
