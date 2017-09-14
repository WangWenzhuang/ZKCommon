//
//  UIViewController-Extension.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/9/14.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

extension UIViewController {
    //MARK: 导航栏高度
    var navigationBarHeight: CGFloat {
        get {
            return self.navigationController?.navigationBar.frame.size.height ?? 0
        }
    }
    //MARK: 导航栏和状态栏高度
    var navigationBarHeightAndstatusBarHeight: CGFloat {
        get {
            return self.navigationBarHeight + ZKDevice.statusBarHeight
        }
    }
    //MARK: tabBar 高度
    var tabBarHeight: CGFloat {
        get {
            return self.tabBarController?.tabBar.height ?? 0
        }
    }
}
