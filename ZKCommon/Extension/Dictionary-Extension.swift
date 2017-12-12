//
//  Dictionary-Extension.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/12/12.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import ZKLog

public extension Dictionary {
    public func toJSON() -> String {
        if (!JSONSerialization.isValidJSONObject(self)) {
            ZKLog.error("无法解析 JSON")
            return ""
        }
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(data: data, encoding: .utf8) ?? ""
        } catch {
            ZKLog.error("无法解析 JSON")
            return ""
        }
        
    }
}
