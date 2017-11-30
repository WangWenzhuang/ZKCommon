//
//  ZKAlertView.swift
//  ZKAlertView
//
//  Created by 王文壮 on 16/8/4.
//  Copyright © 2016年 ZKTeam. All rights reserved.
//

import UIKit

public typealias ZKCompletion = () -> Void
public typealias ZKClickAtIndex = (_ alertView : UIAlertView, _ buttonIndex : Int) -> Void

public class ZKAlertView {
    
    internal static let object = ZKAlertViewObject()
    
    public static func show(message: String, buttonTitle: String, completion: ZKCompletion? = nil) {
        self.show(nil, message: message, buttonTitle: buttonTitle, completion: completion)
    }
    public static func show(_ title: String?, message: String, buttonTitle: String, completion: ZKCompletion? = nil) {
        self.show(title, message: message, completion: completion, cancleButtonTitle: buttonTitle)
    }
    
    public static func show(message: String, cancleButtonTitle: String, otherButtonTitles: String..., clickAtIndex: @escaping ZKClickAtIndex) {
        self.show(nil, message: message, clickAtIndex: clickAtIndex, cancleButtonTitle: cancleButtonTitle, otherButtonTitles: otherButtonTitles)
    }
    public static func show(_ title: String?, message: String, cancleButtonTitle: String, otherButtonTitles: String..., clickAtIndex: @escaping ZKClickAtIndex) {
        self.show(title, message: message, clickAtIndex: clickAtIndex, cancleButtonTitle: cancleButtonTitle, otherButtonTitles: otherButtonTitles)
    }
    
    private static func show(_ title: String?, message: String?, completion: ZKCompletion? = nil, clickAtIndex: ZKClickAtIndex? = nil, cancleButtonTitle: String?, otherButtonTitles: [String?]? = nil) {
        if clickAtIndex != nil {
            ZKAlertView.object.clickAtIndex = clickAtIndex
        }
        if completion != nil {
            ZKAlertView.object.completion = completion
        }
        let alertView = UIAlertView(title: title, message: message, delegate: ZKAlertView.object, cancelButtonTitle: cancleButtonTitle)
        if let buttonTitles = otherButtonTitles {
            for buttonTitle in buttonTitles {
                if buttonTitle != nil {
                    alertView.addButton(withTitle: buttonTitle)
                }
            }
        }
        alertView.show()
    }
}
