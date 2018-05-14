//
//  UIViewController-Extension.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/9/14.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

public extension UIViewController {
    /// 导航栏高度
    public var navBarHeight: CGFloat {
        get {
            return self.navigationController?.navigationBar.frame.size.height ?? 0
        }
    }
    /// 导航栏和状态栏高度
    public var navBarAndStatusBarHeight: CGFloat {
        get {
            return self.navBarHeight + ZKStatusBarHeight
        }
    }
    /// tabBar 高度
    public var tabBarHeight: CGFloat {
        get {
            return self.tabBarController?.tabBar.height ?? 0
        }
    }
    public func push(_ viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    public func pop() {
        self.navigationController?.popViewController(animated: true)
    }
    
    public func popToRoot() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    public func popToViewController(_ viewController: UIViewController) {
        self.navigationController?.popToViewController(viewController, animated: true)
    }
    
    public func present(_ viewControllerToPresent: UIViewController) {
        self.present(viewControllerToPresent, animated: true)
    }
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}
