//
//  Date.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import UIKit

public extension Date {
    public final class zk {
        /// 当前时间字符串
        public static var nowString: String {
            get {
                return DateFormatter().then {
                    $0.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
                }.string(from: Date())
            }
        }
        /// 格式化时间字符串
        public static func format(_ formatString: String = "yyyy-MM-dd HH:mm:ss") -> String {
            return DateFormatter().then {
                $0.dateFormat = formatString
            }.string(from: Date())
        }
        /// 根据时间字符串转换 Date
        public static func date(_ dateString: String, _ formatString: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
            return DateFormatter().then {
                $0.dateFormat = formatString
            }.date(from: dateString)
        }
    }
}
