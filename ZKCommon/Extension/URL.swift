//
//  URL.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import UIKit

public extension URL {
    /// ZK: 将 URL 从 iCloud 备份文件中排除
    public func addSkipBackupAttribute() {
        if FileManager.default.fileExists(atPath: self.path) {
            do {
                try (self as NSURL).setResourceValue(true, forKey: .isExcludedFromBackupKey)
            } catch {
            }
        }
    }
}
