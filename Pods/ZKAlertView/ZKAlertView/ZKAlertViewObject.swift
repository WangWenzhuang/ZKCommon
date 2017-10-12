//
//  ZKAlertViewObject.swift
//  ZKAlertView
//
//  Created by 王文壮 on 16/8/4.
//  Copyright © 2016年 ZKTeam. All rights reserved.
//
import UIKit

class ZKAlertViewObject: NSObject, UIAlertViewDelegate {
    var ClickAtIndexBlock : ZKClickAtIndexBlock?
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        if ZKAlertView.object.ClickAtIndexBlock !=  nil {
            ZKAlertView.object.ClickAtIndexBlock!(alertView, buttonIndex)
        }
    }
    
    func alertView(_ alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
        ZKAlertView.object.ClickAtIndexBlock = nil
    }
}
