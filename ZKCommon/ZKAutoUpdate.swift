//
//  ZKAutoUpdate.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/7/6.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import ZKLog
import Alamofire
import SwiftyJSON
import PopupDialog

public final class ZKAutoUpdate {
    public static func start(url: String, oldVersion: String) {
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + Double(Int64(30 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
            Alamofire.request(url).responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    if let auditState = json["isAudit"].int {
                        if auditState == 0 {
                            if let version = json["version"].string {
                                if oldVersion != version {
                                    if let forcedUpdate = json["forcedUpdate"].int {
                                        let updateMsg = json["updateMsg"].stringValue
                                        let url = json["url"].stringValue
                                        PopupDialogDefaultView.appearance().messageTextAlignment = .left
                                        let popup = PopupDialog.init(title: "提示", message: updateMsg)
                                        popup.buttonAlignment = .horizontal
                                        let cancelButton = CancelButton.init(title: forcedUpdate == 1 ? "取消" : "下次更新", action: nil)
                                        let updateButton: DefaultButton!
                                        // 强制更新
                                        if forcedUpdate == 1 {
                                            updateButton = DefaultButton(title: "更新", dismissOnTap: true) {
                                                if let u = URL(string: url) {
                                                    UIApplication.shared.openURL(u)
                                                }
                                                exit(0)
                                            }
                                        } else {
                                            updateButton = DefaultButton(title: "马上更新", dismissOnTap: true) {
                                                if let u = URL(string: url) {
                                                    UIApplication.shared.openURL(u)
                                                }
                                            }
                                        }
                                        popup.addButtons([cancelButton, updateButton])
                                        UIWindow.frontWindow?.rootViewController?.present(popup, animated: true, completion: nil)
                                        PopupDialogDefaultView.appearance().messageTextAlignment = .center
                                    }
                                }
                            }
                        }
                    }
                case .failure(let error):
                    ZKLog.error((response.request!.url?.absoluteString)! + "\t******\terror:\r\(error)")
                }
            }
        }
    }
}
