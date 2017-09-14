//
//  ZKDevice.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

//MARK: ZKDevice
public enum ZKiPhoneModel: Int {
    case iPhone4
    case iPhone5
    case iPhone67
    case iPhone67Plus
}

//MARK: ZKDevice
public final class ZKDevice {
    //MARK: 屏幕宽度
    public static var screenWidth: CGFloat {
        get {
            return UIScreen.main.bounds.size.width
        }
    }
    //MARK: 屏幕高度
    public static var screenHeight: CGFloat {
        get {
            return UIScreen.main.bounds.size.height
        }
    }
    //MARK: 状态栏高度
    public static var statusBarHeight: CGFloat {
        get {
            return UIApplication.shared.statusBarFrame.size.height
        }
    }
    //MARK: 设备型号
    public static var iPhoneModels: ZKiPhoneModel {
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
}
