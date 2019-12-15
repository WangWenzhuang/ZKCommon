//
//  String.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import UIKit

public extension String {
    final class zk {
        public static func isNilOrEmpty(_ value: Optional<String>) -> Bool {
            if let str = value {
                return str.isEmpty
            } else {
                return true
            }
        }
    }
    /// ZK: urlEncode 字符串
    var urlEncode: String {
        get {
            if self.isEmpty {
                return self
            }
            return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
    }
    /// ZK: 字符串 Size
    func size(_ font: UIFont, width: CGFloat) -> CGSize {
        let conten = NSString(string: self)
        return conten.boundingRect(
            with: CGSize(width: width, height: UIScreen.main.bounds.size.height),
            options: .usesLineFragmentOrigin,
            attributes: [ NSAttributedString.Key.font: font ],
            context: nil
        ).size
    }
    /// ZK: 是否是手机号
    /// - Returns: Bool
    func isMobileNumber() -> Bool {
        return self.isMatch("^1[0-9]{10}$")
    }
    /// ZK: 是否包含中文
    /// - Returns: Bool
    func isIncludeChinese() -> Bool {
        for (_, value) in self.enumerated() {
            if ("\u{4E00}" <= value  && value <= "\u{9FA5}") {
                return true
            }
        }
        return false
    }
    /// ZK: 正则匹配
    ///
    /// - Parameters:
    ///   - pattern: 正则表达式
    /// - Returns: Bool
    func isMatch(_ pattern: String?) -> Bool {
        guard let pattern = pattern else {
            return false
        }
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: self)
    }
}
