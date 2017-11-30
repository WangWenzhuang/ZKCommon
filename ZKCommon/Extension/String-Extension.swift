//
//  String-Extension.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

//MARK: UIImage
public extension String {
    //MARK: urlEncode 字符串
    public var urlEncode: String {
        get {
            if self.isEmpty {
                return self
            }
            return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
    }
    //MARK: 字符串 size
    public func size(_ font: UIFont, width: CGFloat) -> CGSize {
        let attribute = [ NSAttributedStringKey.font: font ]
        let conten = NSString(string: self)
        return conten.boundingRect(with: CGSize(width: width, height: UIScreen.main.bounds.size.height), options: .usesLineFragmentOrigin, attributes: attribute, context: nil).size
    }
    //MARK: 是否是手机号
    public func isMobileNumber() -> Bool {
        return self.isMatch("^1[0-9]{10}$")
    }
    //MARK: 是否是身份证号
    public func isIDCardNumber() -> Bool{
        if self.count != 18 {
            // 非18位
            return false
        }
        let tmp = self as NSString
        let number = tmp.substring(with: NSMakeRange(0, 17)) as String
        print(number)
        if !number.isMatch("^\\d+$") {
            // 格式错误，非数字
            return false
        }
        let last = (tmp.substring(with: NSMakeRange(17, 1)) as String).lowercased()
        print(last)
        if !last.isMatch("^(\\d|x){1}$") {
            // 最后一位格式错误
            return false
        }
        let dateStr = tmp.substring(with: NSMakeRange(6, 8)) as String
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        guard let date = dateFormatter.date(from: dateStr) else {
            // 日期格式错误
            return false
        }
        print(dateFormatter.string(from: date))
        return true
    }
    //MARK: 替换指定位置身份证号
    public func replaceIDCardNumber(start: Int, length: Int, newValue: String) -> String {
        let s = self as NSString
        return s.replacingCharacters(in: NSMakeRange(start, length), with: newValue)
    }
    //MARK: 正则匹配
    public func isMatch(_ pattern: String?) -> Bool {
        guard let p = pattern else {
            return false
        }
        return NSPredicate(format: "SELF MATCHES %@", p).evaluate(with: self)
    }
}
