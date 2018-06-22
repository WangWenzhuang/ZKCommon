//
//  FMDatabase.swift
//  ZKCommon
//
//  Created by 王文壮 on 2018/5/7.
//  Copyright © 2018年 WangWenzhuang. All rights reserved.
//

import FMDB

public extension FMDatabase {
    public final class zk {
        /// 数据库路径
        public static var dbFilePath = ""
        /// 获取一个数据库实例，已打开
        ///
        /// - Parameters:
        ///   - dbFilePath: 数据库路径，如果传 nil 默认使用 dbFilePath 值
        /// - Returns: 格式化后的时间字符串
        public static func manager(_ dbFilePath: String? = nil) -> FMDatabase {
            let db = FMDatabase(path: dbFilePath ?? self.dbFilePath)
            let isOpen = db.open()
            assert(isOpen, "打开数据库失败")
            return db
        }
    }
}
