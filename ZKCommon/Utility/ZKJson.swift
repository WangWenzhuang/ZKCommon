//
//  ZKJson.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/12/12.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

public final class ZKJson {
    public static func json(_ object: Any) -> String {
        if (!JSONSerialization.isValidJSONObject(object)) {
            print("ZKCommon -> \(Date.zk.nowString) -> : 无法解析 JSON")
            return ""
        }
        do {
            let data = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
            return String(data: data, encoding: .utf8) ?? ""
        } catch {
            print("ZKCommon -> \(Date.zk.nowString) -> : 无法解析 JSON")
            return ""
        }
    }
}
