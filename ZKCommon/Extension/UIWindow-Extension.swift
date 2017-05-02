//
//  UIWindow-Extension.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

// MARK: - UIWindow
public extension UIWindow {
    /// 获得最前 Window
    public static var frontWindow: UIWindow? {
        get {
            let window = UIApplication.shared.windows.reversed().first(where: {
                $0.screen == UIScreen.main &&
                    !$0.isHidden && $0.alpha > 0 &&
                    $0.windowLevel >= UIWindowLevelNormal
            })
            return window
        }
    }
}
