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
        let attribute = [ NSFontAttributeName: font ]
        let conten = NSString(string: self)
        return conten.boundingRect(with: CGSize(width: width, height: UIScreen.main.bounds.size.height), options: .usesLineFragmentOrigin, attributes: attribute, context: nil).size
    }
    //MARK: 是否是手机号
    public func isMobileNumber() -> Bool {
        let mobile = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
        let CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
        let CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
        let CT = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        return ((regextestmobile.evaluate(with: self) == true)
            || (regextestcm.evaluate(with: self)  == true)
            || (regextestct.evaluate(with: self) == true)
            || (regextestcu.evaluate(with: self) == true))
    }
    //MARK: 是否是身份证号
    public func isIDCardNumber() -> Bool{
        let value = self.trimmingCharacters(in: .whitespacesAndNewlines)
        
        var length = 0
        if value == ""{
            return false
        }else{
            length = value.characters.count
            if length != 15 && length != 18{
                return false
            }
        }
        
        //省份代码
        let arearsArray = ["11","12", "13", "14",  "15", "21",  "22", "23",  "31", "32",  "33", "34",  "35", "36",  "37", "41",  "42", "43",  "44", "45",  "46", "50",  "51", "52",  "53", "54",  "61", "62",  "63", "64",  "65", "71",  "81", "82",  "91"]
        let valueStart2 = (value as NSString).substring(to: 2)
        var arareFlag = false
        if arearsArray.contains(valueStart2){
            arareFlag = true
        }
        if !arareFlag{
            return false
        }
        var regularExpression = NSRegularExpression()
        
        var numberofMatch = Int()
        var year = 0
        switch (length){
        case 15:
            year = Int((value as NSString).substring(with: NSRange(location: 6,length: 2)))!
            if year % 4 == 0 || (year % 100 == 0 && year % 4 == 0) {
                do {
                    regularExpression = try NSRegularExpression(pattern: "^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$", options: .caseInsensitive) //检测出生日期的合法性
                } catch {
                }
            } else {
                do {
                    regularExpression =  try NSRegularExpression(pattern: "^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$", options: .caseInsensitive) //检测出生日期的合法性
                } catch {}
            }
            numberofMatch = regularExpression.numberOfMatches(in: value, options:NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, value.characters.count))
            
            if (numberofMatch > 0) {
                return true
            } else {
                return false
            }
        case 18:
            year = Int((value as NSString).substring(with: NSRange(location: 6,length: 4)))!
            if year % 4 == 0 || (year % 100 == 0 && year % 4 == 0){
                do {
                    regularExpression = try NSRegularExpression(pattern: "^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$", options: .caseInsensitive) //检测出生日期的合法性
                    
                } catch {
                    
                }
            } else {
                do {
                    regularExpression =  try NSRegularExpression(pattern: "^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$", options: .caseInsensitive) //检测出生日期的合法性
                } catch {}
            }
            
            numberofMatch = regularExpression.numberOfMatches(in: value, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, value.characters.count))
            
            if (numberofMatch > 0) {
                let s =
                    (Int((value as NSString).substring(with: NSRange(location:0,length:1)))! +
                        Int((value as NSString).substring(with: NSRange(location:10,length:1)))!) * 7 +
                        (Int((value as NSString).substring(with: NSRange(location:1,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:11,length:1)))!) * 9 +
                        (Int((value as NSString).substring(with: NSRange(location:2,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:12,length:1)))!) * 10 +
                        (Int((value as NSString).substring(with: NSRange(location:3,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:13,length:1)))!) * 5 +
                        (Int((value as NSString).substring(with: NSRange(location:4,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:14,length:1)))!) * 8 +
                        (Int((value as NSString).substring(with: NSRange(location:5,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:15,length:1)))!) * 4 +
                        (Int((value as NSString).substring(with: NSRange(location:6,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:16,length:1)))!) *  2 +
                        Int((value as NSString).substring(with: NSRange(location:7,length:1)))! * 1 +
                        Int((value as NSString).substring(with: NSRange(location:8,length:1)))! * 6 +
                        Int((value as NSString).substring(with: NSRange(location:9,length:1)))! * 3
                let Y = s % 11
                var M = "F"
                let JYM = "10X98765432"
                
                M = (JYM as NSString).substring(with: NSRange(location:Y,length:1))
                if M == (value as NSString).substring(with: NSRange(location:17,length:1)).uppercased() {
                    return true
                } else { return false }
            } else {
                return false
            }
        default:
            return false
        }
    }
    //MARK: 正则匹配
    public func isMatch(pattern: String?) -> Bool {
        guard let p = pattern else {
            return false
        }
        return NSPredicate(format: "SELF MATCHES %@", p).evaluate(with: self)
    }
}
