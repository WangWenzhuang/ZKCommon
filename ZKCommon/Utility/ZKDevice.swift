//
//  ZKDevice.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import UIKit

/// ZKDevice
public enum ZKiPhoneModel: Int {
    case iPhone4
    case iPhone5
    case iPhone67
    case iPhone67Plus
}

/// 状态栏高度
public var ZKStatusBarHeight: CGFloat {
    get {
        return UIApplication.shared.statusBarFrame.size.height
    }
}
/// 设备型号
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
