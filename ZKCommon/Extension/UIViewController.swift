//
//  UIViewController.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/9/14.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import UIKit

public extension UIViewController {
    /// ZK: 导航栏高度
    var navigationBarHeight: CGFloat {
        return navigationController?.navigationBar.frame.size.height ?? 0
    }
    /// ZK: 导航栏和状态栏高度
    var navigationBarAndStatusBarHeight: CGFloat {
        return navigationBarHeight + UIApplication.shared.statusBarFrame.size.height
    }
    /// ZK: tabBar 高度
    var tabBarHeight: CGFloat {
        return tabBarController?.tabBar.height ?? 0
    }
    /// ZK: view 的 widht
    var width: CGFloat {
        return view.width
    }
    var height: CGFloat {
        return view.height
    }
    func push(_ viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    func popToRoot(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
    func popToViewController(_ viewController: UIViewController, animated: Bool = true) {
        navigationController?.popToViewController(viewController, animated: animated)
    }
    func present(_ viewControllerToPresent: UIViewController, _ completion: (() -> Swift.Void)? = nil) {
        present(viewControllerToPresent, animated: true, completion: completion)
    }
    func present(_ viewControllerToPresent: UIViewController, animated: Bool) {
        present(viewControllerToPresent, animated: animated, completion: nil)
    }
    func dismiss(_ completion: (() -> Swift.Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
    func dismiss(animated: Bool) {
        dismiss(animated: animated, completion: nil)
    }
}
