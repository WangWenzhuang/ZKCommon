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
        public static var dbFilePath = ""

        public static func manager(_ dbFilePath: String? = nil) -> FMDatabase {
            let db = FMDatabase(path: dbFilePath ?? self.dbFilePath)
            let isOpen = db.open()
            assert(isOpen, "打开数据库失败")
            return db
        }
    }
}
