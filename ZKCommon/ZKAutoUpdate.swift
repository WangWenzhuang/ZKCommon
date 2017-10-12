//
//  ZKAutoUpdate.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/7/6.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import ZKAlertView
import ZKAlamofire

public final class ZKAutoUpdate {
    public static func start(url: String, oldVersion: String) {
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + Double(Int64(30 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
            ZKAlamofire.get(url, parameters: nil, success: { (json) in
                let auditState = json["isAudit"].intValue
                let updateMsg = json["updateMsg"].stringValue
                let forcedUpdate = json["forcedUpdate"].intValue
                let url = json["url"].stringValue
                if auditState == 0 {
                    let version = json["version"].stringValue
                    if oldVersion != version {
                        // 强制更新
                        if forcedUpdate == 1 {
                            ZKAlertView.showAlertView("提示", message: updateMsg, buttonTitle: "更新", clickAtIndexBlock: { (alertView, buttonIndex) in
                                UIApplication.shared.openURL(URL(string: url)!)
                                exit(0)
                            })
                        } else {
                            ZKAlertView.showAlertView("提示", message: updateMsg, clickAtIndexBlock: { (alertView, buttonIndex) in
                                if buttonIndex == 1 {
                                    UIApplication.shared.openURL(URL(string: url)!)
                                }
                            }, cancleButtonTitle: "下次更新", otherButtonTitles: "马上更新")
                        }
                    }
                }
            })
        }
    }
}
