//
//  FileManager.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/6/29.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

public extension FileManager {
    //MARK: 判断文件或文件夹是否存在
    public static func exists(_ path: String) -> Bool {
        return FileManager.default.fileExists(atPath: path)
    }
    //MARK: 创建文件夹
    public static func createDirectory(_ path: String) -> Bool {
        do {
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            return true
        } catch {
            return false
        }
    }
    //MARK: 获取单个文件大小
    public static func fileSizeAtPath(_ path: String) -> Double {
        var size: Double = 0
        if FileManager.exists(path) {
            do {
                let attr = try FileManager.default.attributesOfItem(atPath: path)
                size = Double(attr[.size] as! UInt64)
            } catch {
            }
        }
        return size
    }
    //MARK: 获取文件夹大小
    public static func folderSizeAtPath(_ path: String) -> Double
    {
        var size: Double = 0
        guard FileManager.exists(path) else {
            return size
        }
        do {
            let files = try FileManager.default.contentsOfDirectory(atPath: path)
            for file in files {
                size += FileManager.fileSizeAtPath("\(path)/\(file)")
            }
        } catch {
        }
        return size / 1024 / 1024
    }
}
