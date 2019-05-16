//
//  String.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import UIKit
import JavaScriptCore

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
            return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
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
    /// ZK: 是否是身份证号
    /// - Returns: Bool
    func isIDCardNumber() -> Bool {
        let context = JSContext()
        _ = context?.evaluateScript("var num='\(self)';function checkIdcard(num){num=num.toUpperCase();if(!(/(^\\d{15}$)|(^\\d{17}([0-9]|X)$)/.test(num))){return false;}var len,re;len=num.length;if(len==15){re=new RegExp(/^(\\d{6})(\\d{2})(\\d{2})(\\d{2})(\\d{3})$/);var arrSplit=num.match(re);var dtmBirth=new Date('19'+arrSplit[2]+'/'+arrSplit[3]+'/'+arrSplit[4]);var bGoodDay;bGoodDay=(dtmBirth.getYear()==Number(arrSplit[2]))&&((dtmBirth.getMonth()+1)==Number(arrSplit[3]))&&(dtmBirth.getDate()==Number(arrSplit[4]));if(!bGoodDay){return false;}else{var arrInt=[7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2];var arrCh=['1','0','X','9','8','7','6','5','4','3','2'];var nTemp=0,i;num=num.substr(0,6)+'19'+num.substr(6,num.length-6);for(i=0;i<17;i++){nTemp+=num.substr(i,1)*arrInt[i];}num+=arrCh[nTemp%11];return true;}}if(len==18){re=new RegExp(/^(\\d{6})(\\d{4})(\\d{2})(\\d{2})(\\d{3})([0-9]|X)$/);var arrSplit=num.match(re);var dtmBirth=new Date(arrSplit[2]+'/'+arrSplit[3]+'/'+arrSplit[4]);var bGoodDay;bGoodDay=(dtmBirth.getFullYear()==Number(arrSplit[2]))&&((dtmBirth.getMonth()+1)==Number(arrSplit[3]))&&(dtmBirth.getDate()==Number(arrSplit[4]));if(!bGoodDay){return false;}else{var valnum;var arrInt=[7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2];var arrCh=['1','0','X','9','8','7','6','5','4','3','2'];var nTemp=0,i;for(i=0;i<17;i++){nTemp+=num.substr(i, 1)*arrInt[i];}valnum=arrCh[nTemp%11];if(valnum!=num.substr(17,1)){return false;}return true;}}return false;}")
        return context!.evaluateScript("checkIdcard(num);").toBool()
    }
    /// ZK: 替换指定位置身份证号
    ///
    /// - Parameters:
    ///   - start: 开始位置
    ///   - length: 长度
    ///   - newValue: 替换的新字符
    /// - Returns: 替换后的字符串
    func replaceIDCardNumber(start: Int, length: Int, newValue: String) -> String {
        let s = self as NSString
        return s.replacingCharacters(in: NSRange(location: start, length: length), with: newValue)
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
        guard let p = pattern else {
            return false
        }
        return NSPredicate(format: "SELF MATCHES %@", p).evaluate(with: self)
    }
}
