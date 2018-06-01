//
//  UUID.swift
//  ZKCommon
//
//  Created by 王文壮 on 2018/6/1.
//  Copyright © 2018年 WangWenzhuang. All rights reserved.
//

import UIKit

public extension UUID {
    public final class zk {
        static var id: String {
            get {
                return NSString(string: UUID().uuidString).replacingOccurrences(of: "-", with: "")
            }
        }
    }
}
