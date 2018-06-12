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
import CleanroomLogger

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
                                        Log.debug?.message("更新内容：\(updateMsg)")
                                        let url = json["url"].stringValue
                                        // 强制更新
                                        if forcedUpdate == 1 {
                                            Log.debug?.message("强制更新(\(forcedUpdate))")
                                            PopupDialog.zk.show("更新提示", message: updateMsg, buttonTitle: "更新", completion: {
                                                if let u = URL(string: url) {
                                                    UIApplication.shared.openURL(u)
                                                }
                                                exit(0)
                                            })
                                        } else {
                                            Log.debug?.message("非强制更新(\(forcedUpdate))")
                                            PopupDialog.zk.show("更新提示", message: updateMsg, otherButtonTitle: "马上更新", cancelTitle: "下次更新", completion: {
                                                if let u = URL(string: url) {
                                                    UIApplication.shared.openURL(u)
                                                }
                                            })
                                        }
                                    }
                                } else {
                                    Log.debug?.message("版本一致：\(version)")
                                }
                            }
                        } else {
                            Log.debug?.message("正在审核：\(auditState)")
                        }
                    }
                case .failure(let error):
                    Log.debug?.message("请求更新接口失败：\(error)")
                }
            }
        }
    }
}
