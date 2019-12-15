//
//  NSObject.swift
//  ZKCommon
//
//  Created by 王文壮 on 2019/12/16.
//  Copyright © 2019 WangWenzhuang. All rights reserved.
//

import UIKit

extension NSObject {
    func addNotification(_ selector: Selector, name: NSNotification.Name?, object: Any? = nil) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: object)
    }
    
    func removeAllNotification() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func removeNotification(_ name: NSNotification.Name?, object: Any? = nil) {
        NotificationCenter.default.removeObserver(self, name: name, object: object)
    }
    
    func postNotification(_ name: NSNotification.Name, userInfo: [AnyHashable : Any]? = nil, object: Any? = nil) {
        NotificationCenter.default.post(name: name, object: object, userInfo: userInfo)
    }
}
