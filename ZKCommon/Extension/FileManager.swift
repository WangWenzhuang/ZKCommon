//
//  FileManager.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/6/29.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import UIKit

public extension FileManager {
    public final class zk {
        /// ZK: 判断文件或文件夹是否存在
        ///
        /// - Parameters:
        ///   - path: 文件路径
        /// - Returns: Bool
        public static func exists(_ path: String) -> Bool {
            return FileManager.default.fileExists(atPath: path)
        }
        /// ZK: 创建文件夹
        ///
        /// - Parameters:
        ///   - path: 文件夹路径
        public static func createDirectory(_ path: String) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("ZKCommon -> \(Date.zk.nowString) -> : 创建文件夹失败：\(path)")
            }
        }
        /// ZK: 单个文件大小
        ///
        /// - Parameters:
        ///   - path: 文件路径
        /// - Returns: 文件大小
        public static func fileSizeAtPath(_ path: String) -> Double {
            var size: Double = 0
            if self.exists(path) {
                do {
                    let attr = try FileManager.default.attributesOfItem(atPath: path)
                    size = Double(attr[.size] as! UInt64)
                } catch {
                }
            }
            return size
        }
        /// ZK: 获取文件夹大小
        ///
        /// - Parameters:
        ///   - path: 文件夹路径
        /// - Returns: 文件夹大小
        public static func folderSizeAtPath(_ path: String) -> Double {
            var size: Double = 0
            guard self.exists(path) else {
                return size
            }
            do {
                let files = try FileManager.default.contentsOfDirectory(atPath: path)
                for file in files {
                    size += self.fileSizeAtPath("\(path)/\(file)")
                }
            } catch {
            }
            return size / 1024 / 1024
        }
        /// ZK: 删除文件
        ///
        /// - Parameters:
        ///   - path: 文件路径
        public static func delete(_ path: String) {
            do {
                try FileManager.default.removeItem(atPath: path)
            } catch {
                print("ZKCommon -> \(Date.zk.nowString) -> : 删除文件失败：\(path)")
            }
        }
    }
}
