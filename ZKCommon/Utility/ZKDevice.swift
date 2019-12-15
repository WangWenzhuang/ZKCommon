//
//  ZKDevice.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import UIKit

/// ZK: ZKDevice
public enum ZKiPhoneModel: Int {
    case iPhone4
    case iPhone5
    case iPhone67
    case iPhone67Plus
}

/// ZK: 状态栏高度
public var ZKStatusBarHeight: CGFloat {
    return UIApplication.shared.statusBarFrame.size.height
}
/// ZK: 设备型号
public var ZKiPhoneModels: ZKiPhoneModel {
    get {
        let screenHeight = UIScreen.main.bounds.size.height
        if screenHeight == 480 {
            return .iPhone4
        } else if screenHeight == 568 {
            return .iPhone5
        } else if screenHeight == 667 {
            return .iPhone67
        } else { // 736
            return .iPhone67Plus
        }
    }
}

public final class ZKDevice {
    final class zk {
        public static var isPad: Bool {
            return UIDevice.current.model == "iPad"
        }
        
        public static var isPhoneX: Bool {
            if #available(iOS 11.0, *) {
                return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone && UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0 > 0
            } else {
                return false
            }
        }
        
        public static var safeAreaBottom: CGFloat {
            if #available(iOS 11.0, *) {
                return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
            } else {
                return 0
            }
        }
        
        public static var safeAreaTop: CGFloat {
            if #available(iOS 11.0, *) {
                return UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
            } else {
                return 0
            }
        }
        
        public static var safeAreaLeft: CGFloat {
            if #available(iOS 11.0, *) {
                return UIApplication.shared.keyWindow?.safeAreaInsets.left ?? 0
            } else {
                return 0
            }
        }
        
        public static var safeAreaRight: CGFloat {
            if #available(iOS 11.0, *) {
                return UIApplication.shared.keyWindow?.safeAreaInsets.right ?? 0
            } else {
                return 0
            }
        }
    }
}
