//
//  Date-Extension.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

public extension Date {
    public final class zk {
        /// 当前时间字符串
        public static var nowString: String {
            get {
                let format = DateFormatter()
                format.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
                return format.string(from: Date())
            }
        }
        /// 格式化时间字符串
        public static func format(_ formatString: String = "yyyy-MM-dd HH:mm:ss") -> String {
            let format = DateFormatter()
            format.dateFormat = formatString
            return format.string(from: Date())
        }
    }
}
