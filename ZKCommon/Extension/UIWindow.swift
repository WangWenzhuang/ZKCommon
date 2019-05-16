//
//  UIWindow.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import UIKit

public extension UIWindow {
    final class zk {
        /// ZK: 最前 Window
        public static var frontWindow: UIWindow? {
            return UIApplication.shared.windows.reversed().first(where: {
                $0.screen == UIScreen.main &&
                    !$0.isHidden && $0.alpha > 0 &&
                    $0.windowLevel == UIWindow.Level.normal
            })
        }
        
        /// ZK: 最前 Window 活动的控制器
        public static var visibleViewController: UIViewController? {
            return visibleViewControllerFrom(frontWindow?.rootViewController)
        }
        
        static func visibleViewControllerFrom(_ viewController: UIViewController?) -> UIViewController? {
            if let navigationController = viewController as? UINavigationController {
                return visibleViewControllerFrom(navigationController.visibleViewController)
            } else if let tabBarController = viewController as? UITabBarController {
                return visibleViewControllerFrom(tabBarController.selectedViewController)
            } else {
                if let presentedViewController = viewController?.presentedViewController {
                    return visibleViewControllerFrom(presentedViewController)
                } else {
                    return viewController
                }
            }
        }
    }
}
