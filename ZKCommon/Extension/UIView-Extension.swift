//
//  UIView-Extension.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/2/23.
//  Copyright © 2017年 北京亿和博嘉教育科技有限公司. All rights reserved.
//

//MARK: UIView
public extension UIView {
    //MARK: 视图 width 值
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
    }
    //MARK: 视图 height 值
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
    }
    //MARK: 视图 x 值
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
    }
    //MARK: 视图 y 值
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
    }
    //MARK: 视图右侧 y 值
    public var bottomY: CGFloat {
        get {
            return self.frame.size.height + self.frame.origin.y
        }
    }
    //MARK: 视图右侧 x 值
    public var rightX: CGFloat {
        get {
            return self.frame.size.width + self.frame.origin.x
        }
    }
}
