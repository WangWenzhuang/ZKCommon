//
//  FMDatabase-Extension.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import FMDB

public extension FMDatabase {
    public static func manager(dbFileName: String) -> FMDatabase {
        let db = FMDatabase(path: dbFileName)
        let isOpen = db?.open()
        assert(isOpen!, "打开数据库失败")
        return db!
    }
}
