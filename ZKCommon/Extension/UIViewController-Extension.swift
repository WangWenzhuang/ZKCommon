//
//  UIViewController-Extension.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/9/14.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

public extension UIViewController {
    //MARK: 导航栏高度
    public var navBarHeight: CGFloat {
        get {
            return self.navigationController?.navigationBar.frame.size.height ?? 0
        }
    }
    //MARK: 导航栏和状态栏高度
    public var navBarAndStatusBarHeight: CGFloat {
        get {
            return self.navBarHeight + ZKStatusBarHeight
        }
    }
    //MARK: tabBar 高度
    public var tabBarHeight: CGFloat {
        get {
            return self.tabBarController?.tabBar.height ?? 0
        }
    }
}
