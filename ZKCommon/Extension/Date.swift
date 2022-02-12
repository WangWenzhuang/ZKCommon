//
//  Date.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import UIKit

public extension Date {
    final class zk {
        /// ZK: 当前时间字符串
        public static var nowString: String {
            return format()
        }
        /// ZK: 格式化时间字符串
        ///
        /// - Parameters:
        ///   - formatString: 格式化字符串，默认"yyyy-MM-dd HH:mm:ss"
        /// - Returns: 格式化后的时间字符串
        public static func format(_ formatString: String = "yyyy-MM-dd HH:mm:ss") -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = formatString
            return dateFormatter.string(from: Date())
        }
        /// ZK: 根据时间字符串转换 Date
        ///
        /// - Parameters:
        ///   - dateString: 时间字符串
        ///   - formatString: 格式化字符串，默认"yyyy-MM-dd HH:mm:ss"
        /// - Returns: optional Date
        public static func date(_ dateString: String, _ formatString: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = formatString
            return dateFormatter.date(from: dateString)
        }
    }
}
