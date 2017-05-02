//
//  ZKLog.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

// MARK: - ZKLog
public final class ZKLog {
    /// debug 模式 debug 情景输出
    public static func debug(_ item: Any) {
        #if DEBUG
            print("[debug] - \(Date.nowString)\t\(item)")
        #endif
    }
    /// debug 模式 error 情景输出
    public static func error(_ item: Any) {
        #if DEBUG
            print("[error] - \(Date.nowString)\t\(item)")
        #endif
    }
}
