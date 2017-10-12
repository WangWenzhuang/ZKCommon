//
//  ZKAlertView.swift
//  ZKAlertView
//
//  Created by 王文壮 on 16/8/4.
//  Copyright © 2016年 ZKTeam. All rights reserved.
//

import UIKit

public typealias ZKClickAtIndexBlock = (_ alertView : UIAlertView, _ buttonIndex : Int) -> Void

public class ZKAlertView: NSObject {
    internal static let object = ZKAlertViewObject()
    
    public static func showAlertView(_ title : String, message : String, buttonTitle : String) {
        ZKAlertView.showAlertView(title, message: message, buttonTitle: buttonTitle, clickAtIndexBlock: nil)
    }
    
    public static func showAlertView(_ title : String, message : String, buttonTitle : String, clickAtIndexBlock : ZKClickAtIndexBlock!) {
        ZKAlertView.showAlertView(title, message: message, clickAtIndexBlock: clickAtIndexBlock, cancleButtonTitle: buttonTitle, otherButtonTitles: nil)
    }
    
    public static func showAlertView(_ title : String, message : String, clickAtIndexBlock : ZKClickAtIndexBlock!, cancleButtonTitle : String, otherButtonTitles : String!...) {
        if clickAtIndexBlock != nil {
            ZKAlertView.object.ClickAtIndexBlock = clickAtIndexBlock
        }
        let alertView = UIAlertView.init(title: title, message: message, delegate: ZKAlertView.object, cancelButtonTitle: cancleButtonTitle)
        for buttonTitle in otherButtonTitles {
            if buttonTitle == nil {
                break
            }
            alertView.addButton(withTitle: buttonTitle)
        }
        alertView.show()
    }
}
