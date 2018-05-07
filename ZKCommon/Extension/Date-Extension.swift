//
//  Date-Extension.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

//MARK: UIImage
public extension Date {
    public final class zk {
        //MARK: 当前时间字符串
        public static var nowString: String {
            get {
                let format = DateFormatter()
                format.dateFormat = "HH:mm:ss.SSS"
                return format.string(from: Date())
            }
        }
    }
}
