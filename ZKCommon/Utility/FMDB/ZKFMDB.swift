//
//  ZKFmdb.swift
//  ZKCommon
//
//  Created by 王文壮 on 2018/6/12.
//  Copyright © 2018 WangWenzhuang. All rights reserved.
//

import FMDB
import Then
import ObjectMapper
import CleanroomLogger

/// 线程安全
public final class ZKFMDBQueue {
    public static func scalar(
        _ sql: String,
        values: [Any]? = nil,
        completion: ((_ result: Int) -> Void)
    ) {
        FMDatabaseQueue(path: FMDatabase.zk.dbFilePath).do {
            $0.inTransaction { db, rollback in
                var result: Int = 0
                do {
                    let table = try db.executeQuery(sql, values: values)
                    if table.next() {
                        result = Int(table.int(forColumnIndex: 0))
                    }
                } catch let error {
                    
                    Log.error?.value(error)
                }
                db.close()
                completion(result)
            }
        }
    }
    
    public static func executNoQuery(_ sql: String, values: [Any]? = nil) {
        FMDatabaseQueue(path: FMDatabase.zk.dbFilePath).do {
            $0.inTransaction { db, rollback in
                do {
                    try db.executeUpdate(sql, values: values)
                } catch {
                    rollback.pointee = true
                    Log.error?.value(error)
                }
                db.close()
            }
        }
    }
    
    public static func executeStatements(_ sql: String) {
        FMDatabaseQueue(path: FMDatabase.zk.dbFilePath).do {
            $0.inTransaction { db, rollback in
                db.executeStatements(sql)
            }
            $0.close()
        }
    }
}

public final class ZKFMDB {
    public static func scalar(_ sql: String, values: [Any]? = nil) -> Int {
        var result = 0
        FMDatabase.zk.manager().do {
            do {
                let table = try $0.executeQuery(sql, values: values)
                if table.next() {
                    result = Int(table.int(forColumnIndex: 0))
                }
            } catch let error {
                Log.error?.value(error)
            }
            $0.close()
        }
        return result
    }
    
    public static func executNoQuery(_ sql: String, values: [Any]? = nil) {
        FMDatabase.zk.manager().do {
            do {
                try $0.executeUpdate(sql, values: values)
            } catch let error {
                Log.error?.value(error)
            }
            $0.close()
        }
    }
    
    public static func executeStatements(_ sql: String) {
        FMDatabase.zk.manager().do {
            $0.executeStatements(sql)
            $0.close()
        }
    }
}
/// 线程安全查询
public final class ZKFMDBQueryQueue<T> where T: ZKModel {
    public static func executeQuery(
        _ sql: String,
        values: [Any]? = nil,
        completion: ((_ list: [T]) -> Void)
        ) {
        FMDatabaseQueue(path: FMDatabase.zk.dbFilePath).do {
            $0.inTransaction { db, rollback in
                completion(ZKFMDBConvert<T>.query(db, sql: sql, values: values))
            }
        }
    }
}

public final class ZKFMDBQuery<T> where T: ZKModel {
    public static func executeQuery(_ sql: String, values: [Any]? = nil) -> [T] {
        return ZKFMDBConvert<T>.query(FMDatabase.zk.manager(), sql: sql, values: values)
    }
}

fileprivate final class ZKFMDBConvert<T> where T: ZKModel {
    static func query(_ db: FMDatabase, sql: String, values: [Any]? = nil) -> [T] {
        var list: [T] = []
        let members = T.members
        do {
            let table = try db.executeQuery(sql, values: values)
            let columnCount = table.columnCount
            var objList: [[String: Any?]] = []
            while table.next() {
                var object: [String: Any?] = [:]
                for i in 0...columnCount - 1 {
                    let columnName = table.columnName(for: i)!
                    let value = table.object(forColumnIndex: i)
                    let member = members.first(where: { m in
                        return m.lowercased() == columnName.lowercased()
                    })
                    if let m = member, let v = value {
                        object[m] = v
                    }
                }
                objList.append(object)
            }
            if objList.count > 0 {
                if let array = Mapper<T>().mapArray(JSONObject: objList) {
                    list.append(contentsOf: array)
                }
            }
        } catch let error {
            Log.error?.value(error)
        }
        db.close()
        return list
    }
}
