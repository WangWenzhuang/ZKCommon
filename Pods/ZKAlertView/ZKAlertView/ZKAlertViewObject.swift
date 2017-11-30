//
//  ZKAlertViewObject.swift
//  ZKAlertView
//
//  Created by 王文壮 on 16/8/4.
//  Copyright © 2016年 ZKTeam. All rights reserved.
//
import UIKit

class ZKAlertViewObject: NSObject, UIAlertViewDelegate {
    var completion : ZKCompletion?
    var clickAtIndex : ZKClickAtIndex?
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        if ZKAlertView.object.completion !=  nil {
            ZKAlertView.object.completion!()
        }
        if ZKAlertView.object.clickAtIndex != nil {
            ZKAlertView.object.clickAtIndex!(alertView, buttonIndex)
        }
    }
    
    func alertView(_ alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
        ZKAlertView.object.completion = nil
        ZKAlertView.object.clickAtIndex = nil
    }
}
