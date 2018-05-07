//
//  ZKAutoUpdate.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/7/6.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

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
                                        print("ZKCommon -> \(Date.zk.nowString) -> : 更新内容：\(updateMsg)")
                                        let url = json["url"].stringValue
                                        let popup = PopupDialog(title: "更新提示", message: updateMsg)
                                        popup.buttonAlignment = .horizontal
                                        let updateButton: DefaultButton!
                                        // 强制更新
                                        if forcedUpdate == 1 {
                                            print("ZKCommon -> \(Date.zk.nowString) -> : 强制更新(\(forcedUpdate))")
                                            updateButton = DefaultButton(title: "更新", dismissOnTap: true) {
                                                if let u = URL(string: url) {
                                                    UIApplication.shared.openURL(u)
                                                }
                                                exit(0)
                                            }
                                            popup.addButtons([updateButton])
                                        } else {
                                            print("ZKCommon -> \(Date.zk.nowString) -> : 非强制更新(\(forcedUpdate))")
                                            updateButton = DefaultButton(title: "马上更新", dismissOnTap: true) {
                                                if let u = URL(string: url) {
                                                    UIApplication.shared.openURL(u)
                                                }
                                            }
                                            let cancelButton = CancelButton.init(title: "下次更新", action: nil)
                                            popup.addButtons([cancelButton, updateButton])
                                        }
                                        UIWindow.zk.frontWindow?.rootViewController?.present(popup, animated: true, completion: nil)
                                    }
                                } else {
                                    print("ZKCommon -> \(Date.zk.nowString) -> : 版本一致：\(version)")
                                }
                            }
                        } else {
                            print("ZKCommon -> \(Date.zk.nowString) -> : 正在审核：\(auditState)")
                        }
                    }
                case .failure(let error):
                    print("ZKCommon -> \(Date.zk.nowString) -> : \((response.request!.url?.absoluteString)!)\t请求更新接口失败:\r\(error)")
                }
            }
        }
    }
}
